from beet import Context, PluginOptions, configurable
from beet.contrib.autosave import Autosave
from pathlib import Path
from typing import Optional
from zipfile import ZipFile

class PackageOptions(PluginOptions):
  # Should the plugin output this package ?
  package: bool # Required
  zipped: Optional[bool] = False

class BuildOptions(PluginOptions):
  directory: Optional[Path] = None
  separate: PackageOptions
  combined: PackageOptions
  # In case of duplicate extra files when combining packages,
  # should the plugin use the files from assets or data ?
  use_assets_extra: Optional[bool] = True

def beet_default(ctx: Context):
  # Ensure this runs after all other plugins
  autosave = ctx.inject(Autosave)
  autosave.add_link(package_build)

@configurable(validator=BuildOptions)
def package_build(ctx: Context, opts: BuildOptions):
  path = opts.directory or ctx.output_directory
  if path is None:
    return # Skip if no output path has been provided
  
  path /= ctx.project_version

  if opts.separate.package:
    # Package the datapack & resourcepack into separate directories/zip files
    assets_path = path / f"{ctx.project_id}_{ctx.project_version}_resourcepack"
    data_path = path / f"{ctx.project_id}_{ctx.project_version}_datapack"
    if opts.separate.zipped:
      ctx.assets.save(path=assets_path.with_suffix(".zip"), zipped=True, overwrite=True)
      ctx.data.save(path=data_path.with_suffix(".zip"), zipped=True, overwrite=True)
    else:
      ctx.assets.save(path=assets_path, overwrite=True)
      ctx.data.save(path=data_path, overwrite=True)
  
  if opts.combined.package:
    # Remove duplicate extra files (pack.mcmeta, pack.png...)
    if opts.use_assets_extra:
      remove_source = ctx.assets.extra
      remove_target = ctx.data.extra
    else:
      remove_source = ctx.data.extra
      remove_target = ctx.assets.extra
    
    for extra in remove_source:
      if extra in remove_target:
        remove_target.pop(extra)
    
    # Package both data & assets into a single directory/zip file
    combined_path = path / f"{ctx.project_id}_{ctx.project_version}"
    if opts.combined.zipped:
      with ZipFile(combined_path.with_suffix(".zip"), 'w') as zip:
        ctx.assets.dump(zip)
        ctx.data.dump(zip)
    else:
      ctx.assets.dump(combined_path)
      ctx.data.dump(combined_path)
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
  directory = opts.directory or ctx.output_directory
  if directory is None:
    return # Skip if no output directory has been provided
  
  package_path = f"{ctx.project_version}/{ctx.project_id}_{ctx.project_version}"

  if opts.separate.package:
    # Package the datapack & resourcepack into separate directories/zip files
    if opts.separate.zipped:
      ctx.assets.save(path=directory/f"{package_path}_resourcepack.zip", zipped=True, overwrite=True)
      ctx.data.save(path=directory/f"{package_path}_datapack.zip", zipped=True, overwrite=True)
    else:
      ctx.assets.save(path=directory/f"{package_path}_resourcepack", overwrite=True)
      ctx.data.save(path=directory/f"{package_path}_datapack", overwrite=True)
  
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
    if opts.combined.zipped:
      with ZipFile(directory/f"{package_path}.zip", 'w') as zip:
        ctx.assets.dump(zip)
        ctx.data.dump(zip)
    else:
      ctx.assets.dump(directory/package_path)
      ctx.data.dump(directory/package_path)
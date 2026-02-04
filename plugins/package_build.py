from beet import Context, PluginOptions, configurable
from pathlib import Path
from typing import Optional


class BuildOptions(PluginOptions):
  directory: Optional[Path] = None
  zipped: Optional[bool] = True
  # use_version: Optional[bool] = True

def beet_default(ctx: Context):
  ctx.require(package_build)

@configurable(validator=BuildOptions)
def package_build(ctx: Context, opts: BuildOptions):
  path = opts.directory or ctx.output_directory
  if path is None:
    return # Skip if no output path has been provided

  # if opts.use_version:
  #   path /= ctx.project_version
  
  path /= ctx.project_version

  pack_name = f"{ctx.project_id}_{ctx.project_version}"
  if opts.zipped:
    ctx.data.save(path=path/f"{pack_name}_datapack.zip", zipped=True, overwrite=True)
    ctx.assets.save(path=path/f"{pack_name}_resourcepack.zip", zipped=True, overwrite=True)
  else:
    ctx.data.save(path=path/f"{pack_name}_datapack", overwrite=True)
    ctx.assets.save(path=path/f"{pack_name}_resourcepack", overwrite=True)
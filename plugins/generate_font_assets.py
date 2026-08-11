from beet import Context, Texture
from PIL.Image import Image

def create_step_image(ctx: Context, filled_image: Image, empty_image: Image, step: int, offset: int = 0, vertical: bool = False)-> Image:
  image_width = filled_image.width
  image_height = filled_image.height
  if vertical:
    step_overlay = filled_image.crop((0, image_height-offset-step, image_width, image_height))
  else:
    step_overlay = filled_image.crop((0, 0, offset+step, image_height))
  step_image = empty_image.copy()
  step_image.paste(step_overlay)

  return step_image

def generate_fuel_bar(ctx: Context, entries: dict, providers: list)->None:
  # The providers and lang entries for the filled & empty bars are already set
  filled_image = ctx.assets.textures["rida:font/fuel_bar_filled"].image
  empty_image = ctx.assets.textures["rida:font/fuel_bar_empty"].image

  base_name = "rida:font/fuel_bar_{}"

  # Assume the filled & empty images are the same size
  
  offset = 6
  steps = 180
  step_offset = 0 # In case 
  
  # Iterate from 1 to 179 since 0 is the empty sprite and 180 is the filled one
  for i in range(1, steps):
    step_image = create_step_image(ctx, filled_image, empty_image, i, 6)
    step_name = base_name.format(i)
    step_char = chr(0xe000 + (i + step_offset))

    ctx.assets.textures[step_name] = Texture(step_image)

    entries[f"rida.fuel_bar.{i}"] = step_char
    providers.append({
        "type": "bitmap",
        "file": f"{step_name}.png",
        "ascent": 0,
        "height": 42,
        "chars": [
          step_char
        ]
      })


def beet_default(ctx: Context):
  lang = ctx.assets.languages["rida:en_us"]
  lang_entries: dict = lang.data
  
  font = ctx.assets.fonts["rida:hud"]
  font_providers: list = font.data["providers"]

  generate_fuel_bar(ctx, lang_entries, font_providers)

  
  
from beet import Context, Texture
from PIL.Image import Image

IMAGE_SIZE_X = 192
IMAGE_SIZE_Y = 42
SOURCE_OFFSET = 6
SOURCE_LENGTH = 180


def create_step_image(ctx: Context, filled_image: Image, empty_image: Image, step: int)-> Image:
  step_overlay = filled_image.crop((0, 0, SOURCE_OFFSET+step, IMAGE_SIZE_Y))
  step_image = empty_image.copy()
  step_image.paste(step_overlay)

  return step_image
  

def beet_default(ctx: Context):
  font = ctx.assets.fonts["rida:default"]
  font_providers: list = font.data["providers"]

  lang = ctx.assets.languages["rida:en_us"]
  lang_entries: dict = lang.data

  # The providers and lang entries for the filled & empty bars are already set
  filled_image = ctx.assets.textures["rida:gui/fuel_bar_filled"].image
  empty_image = ctx.assets.textures["rida:gui/fuel_bar_empty"].image

  # Iterate from 1 to 179 since 0 is the empty sprite and 180 is the filled one
  for i in range(1, SOURCE_LENGTH):
    step_image = create_step_image(ctx,filled_image,empty_image, i)
    step_name = f"rida:gui/fuel_bar_{i}"
    step_char = chr(0xe000 + i)

    ctx.assets.textures[step_name] = Texture(step_image)

    lang_entries[f"rida.fuel_bar.{i}"] = step_char
    font_providers.append({
        "type": "bitmap",
        "file": f"{step_name}.png",
        "ascent": 0,
        "height": 42,
        "chars": [
          step_char
        ]
      })
  
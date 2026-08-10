from beet import Context, Texture, Model, ItemModel, JsonFile
from beet.core.utils import JsonDict

COLORS: list = [
  "white",
  "light_gray",
  "gray",
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "lime",
  "green",
  "cyan",
  "light_blue",
  "blue",
  "purple",
  "magenta",
  "pink"
]
PARTS: list = [
  "body",
  "nose",
  "thruster"
]


def generate_atlas(ctx: Context, texture_paths: list):
  '''
  Add paletted permutations to the blocks atlas<br><br>
  **Note:** palette_colors is a 4*16 image that gets split by this function<br> 
  to create 16 palette images, since it's easier to edit a single image
  '''
  atlas = ctx.assets.atlases["minecraft:blocks"]

  # Split palette_colors using Pillow and remove it from the output pack
  colors_image = ctx.assets.textures.pop("rida:palette/palette_colors").image
  for color_index in range(len(COLORS)):
    color = COLORS[color_index]
    color_image = colors_image.crop((0, color_index, 4, color_index+1))
    ctx.assets.textures[f"rida:palette/{color}"] = Texture(color_image)
  
  # Create the paletted permutations based on the list of colors
  atlas_paletted = {
    "type": "paletted_permutations",
    "palette_key": "rida:palette/palette_key",
    "permutations": {},
    "textures": []
  }
  # Add a permutation for every color
  for color in COLORS:
    atlas_paletted["permutations"][color] = f"rida:palette/{color}"

  # Add a reference to all textures that should be paletted
  for path in texture_paths:
    atlas_paletted["textures"].append(path)
  
  atlas.data["sources"].append(atlas_paletted)


def generate_models(ctx: Context, model_path: str, texture_path: str, target_texture: str = "layer0"):
  '''
  Replace the `target_texture` of the source model at `model_path` by a reference<br>
  and create a child model for every color with the base `texture_path`
  '''
  parent_model = ctx.assets.models.get(model_path)
  if not parent_model:
    print("Model doesn't exist")
    return # Skip model if it doesn't exist
  
  parent_model.data["textures"][target_texture] = f"#color"

  for color in COLORS:
    child_model_path = f"{model_path}_{color}"
    child_model_data = {
      "parent": model_path,
      "textures": {
        "color": f"{texture_path}_{color}"
      }
    }
    ctx.assets.models[child_model_path] = Model(child_model_data)


def generate_paletted_item_model(ctx: Context, item_path: str, model_path:str, index: int = 0):
  '''
  Create the item model and add a select case for each color
  '''
  # Dye color
  select_cases: list = []
  for color in COLORS:
    select_cases.append({
      "when": f"minecraft:{color}_dye",
      "model": {
        "type": "minecraft:model",
        "model": f"{model_path}_{color}"
      }
    })

  ctx.assets.item_models[item_path] = ItemModel({
      "model": {
        "type": "select",
        "property": "custom_model_data",
        "index": index,
        "cases": select_cases,
        "fallback": {
          "type": "empty"
        }
      }
    })


def generate_ship_item_model(ctx: Context, ships: JsonDict):
  '''
  Create the ship model using a composite of all the parts
  
  Part   | Nose | Body | Thruster | All | Banner
  -------|------|------|----------|-----|--------
  Index  | 0    | 1    | 2        | 3   | 4
  Format |`name`|`name`| `name`   |`id` |`id`
  
  Example: `["racer","rustbucket","brilliant","minecraft:red_dye","minecraft:red_banner"]`
  '''
  ship_composite: list = []

  # The seat is always the same - add it first to the composite
  ship_composite.append({
    "type": "minecraft:model",
    "model": "rida:ship/seat"
  })
  
  # Nested "select" are structured this way:
  # part (3)
  # └ ship (?)
  #   └ color (16)
  # Transformation is set on the part's parent model display, to apply it to all of its models
  
  # Parts
  for part_index in range(len(PARTS)):
    part = PARTS[part_index]
    # Ships
    ship_sections: list = []
    for ship in ships:
      # Colors
      color_sections: list = []
      for color in COLORS:
        color_sections.append({
          "when": f"minecraft:{color}_dye",
          "model": {
            "type": "minecraft:model",
            "model": f"rida:ship/{ship}_{part}_{color}"
          }
        })
      ship_sections.append({
        "when": ship,
        "model": {
          "type": "minecraft:select",
          "property": "minecraft:custom_model_data",
          "index": 3,
          "cases": color_sections,
          "fallback": {
            "type": "minecraft:empty"
          }
        }
      })
    ship_composite.append({
      "type": "minecraft:select",
      "property": "minecraft:custom_model_data",
      "index": part_index,
      "cases": ship_sections,
      "fallback": {
        "type": "minecraft:empty"
      }
    })

  # Add banner colors to the composite model sections
  banner_color_sections = []
  for color in COLORS:
    banner_color_sections.append({
      "when": f"minecraft:{color}_banner",
      "model": {
        "type": "minecraft:special",
        "base": "rida:ship/banner",
        "model": {
          "type": "minecraft:banner",
          "color": color
        }
      }
    })
  ship_composite.append({
    "type": "minecraft:select",
    "property": "minecraft:custom_model_data",
    "index": 4,
    "cases": banner_color_sections,
    "fallback": {
      "type": "minecraft:empty"
    }
  })

  ctx.assets.item_models["rida:ship"] = ItemModel({
    "model": {
      "type": "composite",
      "models": ship_composite
    }
  })


def beet_default(ctx: Context):
  ships_file_path: str | None = ctx.meta.get("ships_file")
  if ships_file_path is None:
    return # Skip if the option doesn't exist

  ships_file = JsonFile(source_path=ships_file_path)
  ships: JsonDict = ships_file.data

  # Doesn't matter in which order we generate assets since
  # references are resolved when loading the pack ingame
  texture_paths: list = []
  for ship in ships:
    texture = f"rida:ship/{ship}_color"
    texture_paths.append(texture)
    for part in PARTS:
      model = f"rida:ship/{ship}_{part}"
      generate_models(ctx, model, texture, "1")
  generate_ship_item_model(ctx, ships)
  generate_atlas(ctx, texture_paths)
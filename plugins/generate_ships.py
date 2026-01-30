from beet import Context, Texture, Model, JsonFile
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
  "nose",
  "wings",
  "thruster"
]

# Add paletted permutations for every ship type to the blocks atlas. 
# NOTE: palette_colors is a 4*16 image that gets split by this function 
# to create 16 palette images, since it's easier to edit a single image.
def generate_ship_atlas(ctx: Context, ship_types: list):
  atlas = ctx.assets.atlases["minecraft:blocks"]

  # Split palette_colors using Pillow and remove it from the output pack
  colors_image = ctx.assets.textures.pop("rida:ship_palette/palette_colors").image
  for i in range(len(COLORS)):
    color = COLORS[i]
    color_image = colors_image.crop((0, i, 4, i+1))
    ctx.assets.textures[f"rida:ship_palette/{color}"] = Texture(color_image)
  
  # Create the paletted permutations based on the list of colors
  atlas_paletted = {
    "type": "paletted_permutations",
    "palette_key": "rida:ship_palette/palette_key",
    "permutations": {},
    "textures": []
  }
  # Add a permutation for every color
  for color in COLORS:
    atlas_paletted["permutations"][color] = f"rida:ship_palette/{color}"
  # Add the "color" texture for every ship type
  for ship_type in ship_types:
    atlas_paletted["textures"].append(f"rida:ship/{ship_type}_color")
  
  atlas.data["sources"].append(atlas_paletted)

# Replace the colored texture of each part of a ship type by a reference,
# and create a child model for each color.
def generate_ship_models(ctx: Context, ship_types: list):
  for part in PARTS:
    for ship_type in ship_types:
      # Modify base models to use a reference instead of a single texture for the color
      parent_model_path = f"rida:ship/{ship_type}_{part}"
      parent_model = ctx.assets.models.get(parent_model_path)
      if parent_model is None:
        continue # Skip if the model doesn't exist (yet)
      parent_model.data["textures"]["1"] = f"#color"
      
      # Create child models that use the different colored textures
      for color in COLORS:
        child_model_path = f"{parent_model_path}_{color}"
        child_model_data = {
          "parent": parent_model_path,
          "textures": {
            "color": f"rida:ship/{ship_type}_color_{color}"
          }
        }
        ctx.assets.models[child_model_path] = Model(child_model_data)

# Create composite model sections in the ship's item model definition.
# Part > Type (select) > Color (select)
# 
# Part:   Nose | Wings | Thruster   All     Banner
# Index:  0    | 1     | 2          3       4
# Format: type | type  | type       color   color_banner
#
# Example: ["racer","trainer","ghastling","red","yellow","white","red_banner"]
def generate_ship_item_model(ctx: Context, ship_types: list):
  ship = ctx.assets.item_models["rida:ship"]
  ship_composite: list = ship.data["model"]["cases"][0]["model"]["models"]
  ship_composite.clear()

  ship_composite.append({
    "type": "minecraft:model",
    "model": "rida:ship/seat"
  })
  
  type_index = 0
  for part in PARTS:
    part_section = {
      "type": "minecraft:select",
      "property": "minecraft:custom_model_data",
      "index": type_index,
      "cases": [],
      "fallback": {
        "type": "minecraft:empty"
      }
    }
    type_index += 1

    # NOTE: for now, use a single color for the whole ship
    #color_index = 3
    for ship_type in ship_types:
      type_section = {
          "when": ship_type,
          "model": {
            "type": "minecraft:select",
            "property": "minecraft:custom_model_data",
            "index": 3,
            "cases": [],
            "fallback": {
              "type": "minecraft:empty"
            }
          }
        }
      #color_index += 1

      for color in COLORS:
        color_section = {
          "when": color,
          "model": {
            "type": "minecraft:model",
            "model": f"rida:ship/{ship_type}/{part}_{color}"
          }
        }

        type_section["model"]["cases"].append(color_section)
      part_section["cases"].append(type_section)
    ship_composite.append(part_section)

  # Add banner colors to the composite model sections
  banner_section = {
    "type": "minecraft:select",
    "property": "minecraft:custom_model_data",
    "index": 4,
    "cases": [],
    "fallback": {
      "type": "minecraft:empty"
    }
  }
  for color in COLORS:
    banner_color_section = {
      "when": f"{color}_banner",
      "model": {
        "type": "minecraft:special",
        "base": "rida:ship/banner",
        "model": {
          "type": "minecraft:banner",
          "color": color
        }
      }
    }

    banner_section["cases"].append(banner_color_section)
  ship_composite.append(banner_section)


def beet_default(ctx: Context):
  ships_file_path: str | None = ctx.meta.get("ships_file")
  if ships_file_path is None:
    return # Skip if the option doesn't exist

  ships_file = JsonFile(source_path=ships_file_path)
  ships: JsonDict = ships_file.data
  ship_types: list = list(ships.keys())
  
  generate_ship_atlas(ctx, ship_types)
  generate_ship_models(ctx, ship_types)
  generate_ship_item_model(ctx, ship_types)
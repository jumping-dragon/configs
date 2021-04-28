import bpy
from math import radians

bpy.ops.mesh.primitive_cube_add()
so = bpy.context.active_object

# move object
so.location[0] = 5

# rotate object
so.rotation_euler[0] += radians(45)

# create modifier
mod_subsurf = so.modifiers.new("My Modifier", "SUBSURF")

# change modifier value
so.modifiers["My Modifier"].levels = 3

# change shade to smooth (1)
bpy.ops.object.shade_smooth()

# change shade to smooth (2)
#mesh = so.data
#for face in mesh.polygons:
#    face.use_smooth = False
    
# create displacement modifier
# https://docs.blender.org/api/current/bpy.types.Modifier.html
mod_displace = so.modifiers.new("My Displacement", "DISPLACE")

# create the texture
# https://docs.blender.org/api/current/bpy.types.Texture.html
new_text = bpy.data.textures.new("My Texture", "DISTORTED_NOISE")

# change the texture settings
new_text.noise_scale = 2.0

# assign the texture to displacement modifier:
mod_displace.texture = new_text

# create the material
new_mat = bpy.data.materials.new(name = "My Material")
so.data.materials.append(new_mat)

new_mat.use_nodes = True
nodes = new_mat.node_tree.nodes

## assigning nodes to variables
material_output = nodes.get("Material Output")
node_emission = nodes.new(type='ShaderNodeEmission')

## assign node values
node_emission.inputs[0].default_value = (0.0, 0.3, 1.0, 1) #color
node_emission.inputs[1].default_value = 500.0 #strength

## add links
links = new_mat.node_tree.links
new_link = links.new(node_emission.outputs[0], material_output.inputs[0])
extends Control


var level_node
var world_levels = [
	[Vector2(200, 300), Vector2(400, 250), Vector2(500, 180), Vector2(350, 160)]
	]

var instantiated_world_levels = []


func set_player_placement(tween_time: float = 0.6):
	var player_tween = create_tween()
	player_tween.tween_property($Player, "global_position", instantiated_world_levels[GlobalVariables.selected_level].global_position, tween_time)
	#$Player.global_position = instantiated_world_levels[GlobalVariables.selected_level].global_position


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_node_scene = load("res://Scenes/Utils/MapLevel/map_level.tscn")
	for level_coords_index in range(len(world_levels[GlobalVariables.selected_world])):
		level_node = level_node_scene.instantiate()
		level_node.position = world_levels[GlobalVariables.selected_world][level_coords_index]
		level_node.world = GlobalVariables.selected_world
		level_node.level = level_coords_index
		instantiated_world_levels.append(level_node)
		add_child(level_node)
	set_player_placement(0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("LEFT") and GlobalVariables.selected_level > 0:
		GlobalVariables.selected_level -= 1
		set_player_placement()
	elif event.is_action_pressed("RIGHT") and GlobalVariables.selected_level < len(instantiated_world_levels) - 1:
		GlobalVariables.selected_level += 1
		set_player_placement()
	elif event.is_action_pressed("USE"):
		var file_loc = "res://Scenes/Levels/World" + str(GlobalVariables.selected_world+1) + "/Level" + str(GlobalVariables.selected_level+1) + "/Level" + str(GlobalVariables.selected_level+1) + ".tscn"
		print(file_loc)
		SceneTransition.change_scene(file_loc)

@tool
extends Control


@export var world: int
@export var level: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "level " + str(level + 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Label.text = "level " + str(level + 1)

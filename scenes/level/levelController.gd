extends Node2D
class_name LevelController

@onready var player = $CharacterBody2D
@onready var void_marker = $voidMarker
@onready var goal = $win_condition
@onready var victory_ui = $CharacterBody2D/victory_ui
# Called when the node enters the scene tree for the first time.
func _ready():
	victory_ui.visible=false
	goal.win.connect(win)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (player.global_position.y > void_marker.global_position.y):
		lose()
		pass
	pass
	
func win():
	print("win")
	victory_ui.visible=true
	pass
func lose():
	get_tree().reload_current_scene()
	pass

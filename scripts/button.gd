extends Button

func _ready() -> void:
	pressed.connect(_on_start)

func _on_start() -> void:
	get_tree().change_scene_to_file("res://scene/level.tscn")

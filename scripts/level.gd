extends Node2D

@onready var brickObject = preload("res://scene/brick.tscn")

var columns = 24
var row = 7
var margin = 50

func _ready() -> void:
	setupLevel()

func setupLevel():
	var colors = getColors()
	colors.shuffle()

	for r in row:
		for c in columns:
			var randomNumber = randi_range(0, 2)
			if randomNumber > 0:

				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (45 * c), margin + (45 * r))

				var sprite = newBrick.get_node("NeonGhostFlameTile")
				if r <= 9:
					sprite.modulate = colors[0]
				if r < 6:
					sprite.modulate = colors[1]
				if r < 3:
					sprite.modulate = colors[2]

				if randi_range(0, 9) == 0:
					newBrick.is_bomb = true
					sprite.modulate = Color(1, 0.2, 0.2)

func _process(_delta: float) -> void:
	pass

func getColors():
	var colors = [
		Color(0, 1, 1, 1),
		Color(0.54, 0.17, 0.89, 1),
		Color(0.68, 1, 0.18, 1),
	]
	return colors

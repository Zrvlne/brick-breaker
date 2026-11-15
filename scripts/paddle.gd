extends CharacterBody2D

const SPEED = 1000.0

var start_y: float

func _ready() -> void:
	start_y = position.y

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity.y = 0
	move_and_slide()
	position.y = start_y

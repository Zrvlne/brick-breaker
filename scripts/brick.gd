extends RigidBody2D

var is_hit = false
@export var is_bomb = false

func hit():
	if is_hit:
		return
	is_hit = true
	remove_from_group("Brick")

	GameManager.addPoints(1)

	if is_bomb:
		GameManager.playBomb()
	else:
		GameManager.playBreak()

	$CPUParticles2D.emitting = true
	$NeonGhostFlameTile.visible = false
	$CollisionShape2D.set_deferred("disabled", true)

	if is_bomb:
		explode()

	var bricksLeft = get_tree().get_nodes_in_group("Brick")
	var ball = get_parent().get_node("main")

	if bricksLeft.size() == 0 and ball.is_active:
		ball.is_active = false
		await get_tree().create_timer(1).timeout
		GameManager.level += 1
		get_tree().call_deferred("reload_current_scene")
	else:
		await get_tree().create_timer(1).timeout
		queue_free()

func explode():
	for b in get_tree().get_nodes_in_group("Brick"):
		if b.global_position.distance_to(global_position) < 80:
			b.hit()

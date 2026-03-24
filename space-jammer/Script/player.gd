extends CharacterBody2D

@export var MAX_SPEED = 400.0
@export var ACCEL = 1500.0
@export var FRICTION = 1200.0
@export var bullet_scene: PackedScene 

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector != Vector2.ZERO:
		# Using numbers directly prevents the 'Nil' error
		velocity = velocity.move_toward(input_vector * 400.0, 1500.0 * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, 1200.0 * delta)

	move_and_slide()
	
	# Keep inside the 1152x648 window
	global_position.x = clamp(global_position.x, 32, 1120)
	global_position.y = clamp(global_position.y, 32, 616)
func _process(_delta):
	# Shoot with Space or Enter
	if Input.is_action_just_pressed("ui_accept"):
		shoot()

func shoot():
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_position = global_position

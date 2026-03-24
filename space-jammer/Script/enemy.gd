extends CharacterBody2D

@export var speed = 100.0
var direction = 1

func _physics_process(_delta):
	velocity.x = speed * direction
	move_and_slide()
	
	# Simple bounce off screen edges (1152x648)
	if global_position.x > 1100 or global_position.x < 50:
		direction *= -1

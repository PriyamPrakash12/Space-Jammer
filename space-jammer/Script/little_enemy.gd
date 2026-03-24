extends CharacterBody2D

@export var speed = 150.0

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("player")
	if player:
		# Fly toward player position
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		# Move straight down if player is gone
		velocity = Vector2(0, speed)
	
	move_and_slide()

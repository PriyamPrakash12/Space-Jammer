extends Node2D

@onready var boss = $Enemy # Matches your Boss node name

func _ready():
	if boss:
		boss.hide()
		boss.process_mode = Node.PROCESS_MODE_DISABLED

func _process(_delta):
	# Counts the "enemies" group you created
	var enemy_count = get_tree().get_nodes_in_group("enemies").size()
	
	# Spawn boss when swarm is gone
	if enemy_count == 0 and boss and not boss.visible:
		boss.show()
		boss.process_mode = Node.PROCESS_MODE_INHERIT

extends Node

signal player_restart_requested

func freezeTime(freeze: bool) -> void:
	var current_world = get_tree().current_scene
	
	if freeze == false:
		current_world.process_mode = Node.PROCESS_MODE_INHERIT
	elif freeze == true:
		current_world.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	else: 
		print("Неправильно")

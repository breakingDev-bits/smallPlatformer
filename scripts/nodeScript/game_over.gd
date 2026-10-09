extends Control

func _on_button_pressed() -> void:
	PauseManager.freezeTime(false)
	
	var old_player = get_tree().get_first_node_in_group("player")
	if old_player:
		old_player.queue_free()
	
	PauseManager.player_restart_requested.emit()
	queue_free() 

extends Node2D

var world_scene_path = "res://scenes/world.tscn"

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file(world_scene_path)

func _on_exit_game_pressed() -> void:
	get_tree().quit()

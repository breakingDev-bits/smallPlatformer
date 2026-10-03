extends Area2D

var gameOverScene = preload("res://scenes/game_over.tscn").instantiate()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().root.add_child(gameOverScene)

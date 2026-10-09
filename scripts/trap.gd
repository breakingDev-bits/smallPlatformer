extends Area2D


const GAME_OVER_SCENE = preload("res://scenes/game_over.tscn")

func _ready() -> void:
	$killer.texture = load("res://image/killer/cactus.png")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var game_over_instance = GAME_OVER_SCENE.instantiate()
		PauseManager.freezeTime(true)
		get_tree().root.add_child(game_over_instance)

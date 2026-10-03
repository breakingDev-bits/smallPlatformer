extends Node2D

@onready var platform = $BackGround/platform

var player_scene = preload("res://player.tscn")

func _ready() -> void:
	spawn_player(Vector2(100, 100))
	
func spawn_player(pos: Vector2) -> void:
	var player = player_scene.instantiate() 

	platform.add_child(player)
	
	player.global_position = pos

extends Node2D

@onready var platform = $BackGround/platform
var player_scene = preload("res://scenes/player.tscn")

func _ready() -> void:
	# Подписываемся на глобальный сигнал рестарта
	PauseManager.player_restart_requested.connect(_on_player_restart)
	
	# Первый спавн при старте
	spawn_player(Vector2(100, 100))

func spawn_player(pos: Vector2) -> void:
	var player = player_scene.instantiate() 
	player.add_to_group("player")
	platform.add_child(player)
	player.global_position = pos

# Функция, которая сработает при клике на кнопку
func _on_player_restart() -> void:
	spawn_player(Vector2(100, 100))

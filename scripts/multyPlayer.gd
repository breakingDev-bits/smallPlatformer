extends Node2D

const PORT = 41291
const MAX_CLIENTS = 60
const IP_ADDRESS = "127.0.0.1"

func _on_create_server_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer

func _on_connect_to_server_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

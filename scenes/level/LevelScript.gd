extends Node2D

onready var floor_scene = preload("res://scenes/world/Floor.tscn")
onready var player = get_node("Player")
onready var camera = player.get_node("Camera2D")

func _on_Floor_generate_floor():
	var floor_instance = floor_scene.instance()
	add_child(floor_instance)
	floor_instance.position.y = camera.global_position.y - 850
	floor_instance.position.x = rand_range(0, 1080)
	floor_instance.connect("generate_floor", self, "_on_Floor_generate_floor")

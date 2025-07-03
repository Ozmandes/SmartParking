extends Control

@onready var start: Button = %Start


func _ready():
	start.pressed.connect(on_start_pressed)


func on_start_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")

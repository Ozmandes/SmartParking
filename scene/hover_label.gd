extends Node3D

@onready var label: Label = %Label


func set_text(input_string: String):
	label.text = input_string


func set_font_size(size: int):
	label.add_theme_font_size_override("font_size", size)

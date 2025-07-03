extends Node3D

@onready var camera: Camera3D = %Camera3D

var target_rotation_y: float

func _unhandled_input(event):
	if event.is_action_pressed("camera_rotate_left"):
		target_rotation_y -= deg_to_rad(90)
	if event.is_action_pressed("camera_rotate_right"):
		target_rotation_y += deg_to_rad(90)


func _physics_process(delta):
	self.rotation.y = lerp_angle(rotation.y, target_rotation_y, delta * 5.0)


func camera_offset(reset: bool = false):
	if reset:
		camera.position = Vector3(1.6, 5, 1.6)
		return
	
	camera.position = Vector3(3.6, 5, -0.4)

extends VehicleBody3D

@onready var camera: Camera3D = %Camera
@onready var id: Node3D = %ID

var disable_flag: bool = false

func _ready():
	camera.make_current()


func _process(_delta):
	if not disable_flag:
		self.steering = Input.get_axis("move_right", "move_left") * .8
		self.engine_force = Input.get_axis("move_backward", "move_forward") * 60


func _input(event):
	if not disable_flag:
		if event.is_action_pressed("brake"):
			self.brake = 1
		
		if event.is_action_released("brake"):
			self.brake = 0
		
		if event.is_action_pressed("park"):
			if self.brake != 0:
				self.brake = 0
			else:
				self.brake = 1
				self.linear_velocity = Vector3.ZERO


func set_disable(flag: bool):
	disable_flag = flag


func set_id(input_id):
	id.set_text(input_id)

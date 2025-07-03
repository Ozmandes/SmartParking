extends Window

@onready var car: VehicleBody3D = %Car
@onready var ui: CanvasLayer = %UI
@onready var information: RichTextLabel = %Information

@onready var enter: Button = %Enter
@onready var exit: Button = %Exit

var id: String = ""
var in_flag: bool = false

signal open_gate


func _ready():
	ui.hide()
	
	self.focus_entered.connect(get_focus)
	self.focus_exited.connect(loose_focus)
	enter.pressed.connect(on_enter)
	exit.pressed.connect(on_exit)


func set_car_position(global_position: Vector3):
	car.global_position = global_position


func get_focus():
	car.set_disable(false)


func loose_focus():
	car.set_disable(true)


func set_id(input_id: String):
	if input_id == "":
		id = "test"
	else:
		id = input_id
	
	car.set_id(id)
	self.title = id


func show_ui():
	if not in_flag:
		information.text = "Space: " + str(get_tree().get_first_node_in_group("parking_manager").empty_parking_num)
		if get_tree().get_first_node_in_group("parking_manager").empty_parking_num == 0:
			enter.set_disabled(true)
			enter.text = "X No Space X"
		else:
			enter.set_disabled(false)
			enter.text = "Enter"
	else:
		information.text = "Farewell"
		enter.text = "Exit"
	
	ui.show()


func on_enter():
	car.brake = 0
	ui.hide()
	
	open_gate.emit()


func on_exit():
	car.brake = 0
	ui.hide()

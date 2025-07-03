extends Node3D

@onready var empty: MeshInstance3D = %Empty
@onready var full: MeshInstance3D = %Full
@onready var display: Node3D = %Display
@onready var car_sensor: Area3D = %CarSensor
@onready var hover_label: Node3D = %HoverLabel
@onready var one_second_count: Timer = %OneSecondCount

@export var parking_id: int = 0
var occupied_flag: bool = false
var time_count: int = 0

var occupied_car_id: String = ""

func _ready():
	empty.show()
	full.hide()
	
	car_sensor.car_enter.connect(on_car_enter)
	car_sensor.car_exit.connect(on_car_exit)
	
	hover_label.set_text(str(parking_id))
	hover_label.set_font_size(512)
	
	one_second_count.timeout.connect(on_one_second_timeout)


func on_car_enter(car: VehicleBody3D):
	occupied_car_id = car.get_parent().id
	occupied_flag = true
	empty.hide()
	full.show()
	
	time_count = 0
	one_second_count.start()
	get_tree().get_first_node_in_group("administer_ui").update_information()


func on_car_exit(car: VehicleBody3D):
	occupied_car_id = ""
	occupied_flag = false
	empty.show()
	full.hide()
	
	time_count = 0
	one_second_count.stop()
	get_tree().get_first_node_in_group("administer_ui").update_information()


func change_display_state(flag: bool):
	if flag:
		display.show()
	else:
		display.hide()


func on_one_second_timeout():
	time_count += 1
	get_tree().get_first_node_in_group("administer_ui").update_information()

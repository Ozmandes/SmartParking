extends Node3D

@onready var car_sensor: Area3D = %CarSensor
@onready var in_sensor: Area3D = %InSensor
@onready var out_sensor: Area3D = %OutSensor
@onready var gate: Node3D = %Gate

@onready var parking_manager: Node3D = %ParkingManager


func _ready():
	car_sensor.car_enter.connect(on_car_enter)
	in_sensor.car_enter.connect(on_car_in)
	out_sensor.car_enter.connect(on_car_out)


func on_car_enter(car: VehicleBody3D):
	car.brake = 1
	car.get_parent().show_ui()
	
	if car.get_parent().open_gate.is_connected(open):
		return
	car.get_parent().open_gate.connect(open)


func on_car_in(car: VehicleBody3D):
	if not car.get_parent().in_flag:
		parking_manager.car_get_in()
	car.get_parent().in_flag = true


func on_car_out(car: VehicleBody3D):
	if car.get_parent().in_flag:
		parking_manager.car_get_out()
	car.get_parent().in_flag = false


func open():
	var open_tween = create_tween()
	open_tween.tween_property(gate, "global_position", global_position + Vector3(0, 1, 0), .8)
	
	await get_tree().create_timer(4).timeout
	var close_tween = create_tween()
	close_tween.tween_property(gate, "global_position", global_position, .8)

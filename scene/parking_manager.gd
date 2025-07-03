extends Node3D

@onready var parking1: Node3D = %Parking1
@onready var parking2: Node3D = %Parking2
@onready var parking3: Node3D = %Parking3
@onready var parking4: Node3D = %Parking4
@onready var parking5: Node3D = %Parking5
@onready var parking6: Node3D = %Parking6
@onready var parking7: Node3D = %Parking7
@onready var parking8: Node3D = %Parking8

var parking_arr: Array = []

const MaxParkingNum: int = 8
var empty_parking_num: int = 8


func _ready():
	parking_arr.append(parking1)
	parking_arr.append(parking2)
	parking_arr.append(parking3)
	parking_arr.append(parking4)
	parking_arr.append(parking5)
	parking_arr.append(parking6)
	parking_arr.append(parking7)
	parking_arr.append(parking8)


func car_get_in():
	empty_parking_num -= 1


func car_get_out():
	empty_parking_num += 1


func change_display_state(flag: bool):
	parking1.change_display_state(flag)
	parking2.change_display_state(flag)
	parking3.change_display_state(flag)
	parking4.change_display_state(flag)
	parking5.change_display_state(flag)
	parking6.change_display_state(flag)
	parking7.change_display_state(flag)
	parking8.change_display_state(flag)


func get_parking_information(id: int) -> String:
	if parking_arr[id-1].occupied_car_id != "":
		return parking_arr[id-1].occupied_car_id + " : " + str(parking_arr[id-1].time_count)
	else:
		return "Empty"

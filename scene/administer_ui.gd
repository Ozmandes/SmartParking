extends CanvasLayer

@onready var generate_new_car: Button = %GenerateNewCar
@onready var enter_id: Button = %EnterID
@onready var spawn_car_position: Marker3D = %SpawnCarPosition
@onready var input_id: MarginContainer = %InputID
@onready var id_editor: TextEdit = %IDEditor

@onready var parking_manager: Node3D = %ParkingManager
@onready var change_state: Button = %ChangeState

@export var car_scene: PackedScene
@export var car_window_scene: PackedScene

@onready var parking1: RichTextLabel =  %Parking1
@onready var parking2: RichTextLabel =  %Parking2
@onready var parking3: RichTextLabel =  %Parking3
@onready var parking4: RichTextLabel =  %Parking4
@onready var parking5: RichTextLabel =  %Parking5
@onready var parking6: RichTextLabel =  %Parking6
@onready var parking7: RichTextLabel =  %Parking7
@onready var parking8: RichTextLabel =  %Parking8

var display_state: bool = false

func _ready():
	input_id.hide()
	
	enter_id.pressed.connect(on_enter_id)
	generate_new_car.pressed.connect(on_generate_new_car)
	change_state.pressed.connect(on_change_state)


func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()



func on_enter_id():
	enter_id.release_focus()
	input_id.show()


func on_generate_new_car():
	generate_new_car.release_focus()
	
	var car_window_instance = car_window_scene.instantiate() as Window
	get_tree().get_first_node_in_group("window_set").add_child(car_window_instance)
	car_window_instance.set_car_position(spawn_car_position.global_position)
	car_window_instance.set_id(id_editor.text)
	
	input_id.hide()
	id_editor.clear()


func on_change_state():
	change_state.release_focus()
	display_state = not display_state
	if display_state:
		change_state.text = "Hide"
	else:
		change_state.text = "Show"
	
	parking_manager.change_display_state(display_state)


func update_information():
	parking1.text = "1 : " + parking_manager.get_parking_information(1)
	parking2.text = "2 : " + parking_manager.get_parking_information(2)
	parking3.text = "3 : " + parking_manager.get_parking_information(3)
	parking4.text = "4 : " + parking_manager.get_parking_information(4)
	parking5.text = "5 : " + parking_manager.get_parking_information(5)
	parking6.text = "6 : " + parking_manager.get_parking_information(6)
	parking7.text = "7 : " + parking_manager.get_parking_information(7)
	parking8.text = "8 : " + parking_manager.get_parking_information(8)

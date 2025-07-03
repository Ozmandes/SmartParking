extends Area3D

signal car_enter
signal car_exit

func _ready():
	self.body_entered.connect(on_body_entere)
	self.body_exited.connect(on_body_exit)


func on_body_entere(body: Node):
	car_enter.emit(body)


func on_body_exit(body: Node):
	car_exit.emit(body)

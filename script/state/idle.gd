extends state
class_name wait

@export var next_state : state
var mouse_position := Vector2(0,0)


func enter():
	pass
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	
	var direction = -($"../..".position-mouse_position)
	
	if direction.length() > 10:
		transitioned.emit(self, next_state)

func _input(event):
	
	if event is InputEventMouseMotion:
		mouse_position = event.position

extends state
class_name wait

@export var next_state : state

func enter():
	pass
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		transitioned.emit(self, next_state)

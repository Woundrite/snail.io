extends state
class_name wait

@export var next_state : state
var mouse_position := Vector2(0,0)


func enter():
	super()
	
func exit():
	super()

func update(delta: float):
	super(delta)
	mouse_position = $"../..".to_local($"../..".get_global_mouse_position())
	
func physics_update(delta: float):
	super(delta)
	
	if mouse_position.length() > 50:
		transitioned.emit(self, next_state)

extends state
class_name move

@export var next_state : state

@onready var AnimPlayer: = $"../../snail_ui"

@export var SPEED = 500.0

func enter():
	super()
	Globals.player_position = $"../..".position
	
func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	Globals.player_position = $"../..".position
	
	#print(spd)
	$"../..".velocity = direction * SPEED
#
	$"../..".move_and_slide()
	
	if direction == Vector2.ZERO:
		transitioned.emit(self, next_state)
	

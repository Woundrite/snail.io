extends state
class_name move

@export var next_state : state

@onready var AnimPlayer: = $"../../snail_ui"

@export var SPEED = 500.0

var mouse_position := Vector2(0,0)

func enter():
	super()
	#Globals.player_position = $"../..".position
	
func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	#Globals.player_position = $"../..".position
	var direction = -($"../..".position-mouse_position)
	if direction.length() <= 10:
		transitioned.emit(self, next_state)
	
	if direction.x < 0:
		if $"../../snail_ui".scale.x < 0 :
			$"../../snail_ui".scale.x*=-1

	else:
		if $"../../snail_ui".scale.x > 0 :
			$"../../snail_ui".scale.x*=-1
	
	#print(direction)
	$"../..".velocity = direction.normalized() * SPEED
#
	$"../..".move_and_slide()
	
	
func _input(event):
	
	if event is InputEventMouseMotion:
		mouse_position = event.position

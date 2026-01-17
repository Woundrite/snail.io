extends Node

@onready var foods = [
preload("res://scene/foods/apple.tscn"),
preload("res://scene/foods/cake.tscn"),
preload("res://scene/foods/kiwi.tscn"),
preload("res://scene/foods/swiss_roll.tscn")
]

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> int:
	
	return 0
	
	var food = foods.pick_random().instantiate()
	var scale = rng.randf_range(0.25,1)
	var pos = Vector2(rng.randf_range(0,1000),rng.randf_range(0,1000))
	#var n = food.get_tree().
	
	food.scale = Vector2(scale,scale)
	food.rotate(rng.randf_range(0,359))
	food.position = pos
	add_child(food)
	

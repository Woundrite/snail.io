extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	$".".position = Vector2(rng.randf_range(0,1000),rng.randf_range(0,1000))
	#queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("yippie")
	queue_free()

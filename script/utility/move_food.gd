extends Node2D

var rng = RandomNumberGenerator.new()

var timer: Timer = Timer.new()
var sprite: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.autostart = false
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	for c in get_node("Area2D").get_children():
		if c is Sprite2D:
			sprite = c
			break
			
	sprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(get_node("Area2D").collision_layer)
	if(get_node("Area2D").collision_layer != 2):
		pass
	else:
		timer.start(0.25)
		$".".position = Vector2(rng.randf_range(0,1000),rng.randf_range(0,1000))

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()


func _on_timer_timeout() -> void:
	get_node("Area2D").collision_layer = 1
	remove_child(get_node("Timer"))
	if(get_node("Area2D").collision_layer == 1):
		sprite.visible = true

extends Node2D

@onready var body = $body
@onready var shell_body = $shell_body
@onready var shell_spiral = $shell_spiral
@onready var eyeball = $eyeball
@onready var pupils = $pupils


func _ready():
	randomize()
	randomize_colors()


# ============================
#   SLITHER.IO COLOR SYSTEM
# ============================

func randomize_colors():
	var body_color = muted_color()
	var shell_color = muted_color_far_from(body_color)
	var spiral_color = muted_color_far_from(shell_color)
	var eye_color = eye_color_far_from(body_color)

	# Apply basic colors
	body.self_modulate = body_color
	shell_body.self_modulate = shell_color
	shell_spiral.self_modulate = spiral_color
	eyeball.self_modulate = eye_color

	# Pupils: darker soft black
	pupils.self_modulate = Color(0.05, 0.05, 0.05)  # darker than before

	# Depth + readability adjustments
	body.self_modulate = body.self_modulate.darkened(0.05)
	shell_body.self_modulate = shell_body.self_modulate.darkened(0.08)

	# 🔥 Spiral should be MUCH darker for clear readability
	shell_spiral.self_modulate = shell_spiral.self_modulate.darkened(1)

func muted_color() -> Color:
	return Color.from_hsv(
		randf(),
		randf_range(0.35, 0.65),
		randf_range(0.35, 0.55)
	)


func muted_color_far_from(other: Color) -> Color:
	var c: Color
	var tries := 0

	while true:
		c = muted_color()
		if abs(c.h - other.h) > 0.2 or tries > 10:
			break
		tries += 1

	return c


func eye_color_far_from(body_color: Color) -> Color:
	var c: Color
	var tries := 0

	while true:
		c = Color.from_hsv(
			randf(),
			randf_range(0.2, 0.4),
			randf_range(0.75, 0.9)
		)
		if abs(c.h - body_color.h) > 0.25 or tries > 10:
			break
		tries += 1

	return c

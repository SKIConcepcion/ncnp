extends Sprite2D

@onready var spiral: Sprite2D = $"."  # Optional; not needed unless referencing externally

var spin_speed = 0.5
var zoom_speed = 2.0           # Speed of pulsing
var zoom_strength = 0.3      # Max scale difference
var base_scale = Vector2.ONE   # Starting scale

var time_accumulator = 0.0

func _ready():
	if Global.ending_trigger:
		queue_free()

	base_scale = scale  # Save the initial scale

func _process(delta: float) -> void:
	rotation += spin_speed * delta

	time_accumulator += delta * zoom_speed

	# Calculate smooth zoom in/out scale
	var scale_factor = 1.0 + sin(time_accumulator) * zoom_strength
	scale = base_scale * scale_factor

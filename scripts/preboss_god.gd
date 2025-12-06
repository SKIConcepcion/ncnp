extends AnimatedSprite2D

@export var move_speed: float = 100.0  # Pixels per second
@export var left_bound: float = -800.0  # X position at which it gets removed

func _ready() -> void:
	# Optionally play animation if you have one
	play()

func _process(delta: float) -> void:
	position.x -= move_speed * delta
	
	if position.x <= left_bound:
		queue_free()

extends Sprite2D

@onready var sprite_2d: Sprite2D = $"."  

var spin_speed = 0.5

func _process(delta: float) -> void:
	rotation += spin_speed * delta

extends Node2D

const SPEED = 90
var direction = -1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $Killzone

func _ready() -> void:
	var safezone1 = get_parent().get_node("borders/safezone")
	var safezone2 = get_parent().get_node("borders/safezone2")

	if safezone1:
		safezone1.body_entered.connect(_on_safezone_body_entered)
		safezone1.body_exited.connect(_on_safezone_body_exited)

	if safezone2:
		safezone2.body_entered.connect(_on_safezone_body_entered)
		safezone2.body_exited.connect(_on_safezone_body_exited)

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true

	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	position.x += direction * SPEED * delta

func _on_safezone_body_entered(body):
	if body.name == "Player": 
		killzone.monitoring = false

func _on_safezone_body_exited(body):
	if body.name == "Player":
		killzone.monitoring = true

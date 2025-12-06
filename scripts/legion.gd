extends Node2D

const SPEED = 200
const STAGGER_INTERVAL = 0.2  # seconds between each move

var direction = -1
var move_timer = 0.0

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $Killzone

func _ready():
	var safezone1 = get_parent().get_node("borders/safezone")
	var safezone2 = get_parent().get_node("borders/safezone2")
	var safezone3 = get_parent().get_node("borders/safezone3")
	var safezone4 = get_parent().get_node("borders/safezone4")
	var safezone5 = get_parent().get_node("borders/safezone5")

	if safezone1:
		safezone1.body_entered.connect(_on_safezone_body_entered)
		safezone1.body_exited.connect(_on_safezone_body_exited)

	if safezone2:
		safezone2.body_entered.connect(_on_safezone_body_entered)
		safezone2.body_exited.connect(_on_safezone_body_exited)

	if safezone3:
		safezone3.body_entered.connect(_on_safezone_body_entered)
		safezone3.body_exited.connect(_on_safezone_body_exited)

	if safezone4:
		safezone4.body_entered.connect(_on_safezone_body_entered)
		safezone4.body_exited.connect(_on_safezone_body_exited)

	if safezone5:
		safezone5.body_entered.connect(_on_safezone_body_entered)
		safezone5.body_exited.connect(_on_safezone_body_exited)

func _process(delta: float) -> void:
	# Update timer
	move_timer -= delta

	# Flip direction if hitting walls
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true

	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false

	# Staggered movement: only move when timer reaches zero
	if move_timer <= 0.0:
		position.x += direction * SPEED * 0.05  # small step instead of full delta
		move_timer = STAGGER_INTERVAL


func _on_safezone_body_entered(body):
	if body.name == "Player": 
		killzone.monitoring = false


func _on_safezone_body_exited(body):
	if body.name == "Player":
		killzone.monitoring = true

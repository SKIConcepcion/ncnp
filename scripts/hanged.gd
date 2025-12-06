extends Node2D

const SPEED = 50
const FLOAT_HEIGHT = -180   
const FLOAT_SPEED_RISE = 1.8
const FLOAT_SPEED_FALL = 1.0
const VISIBLE_DISTANCE = 120.0

var direction = -1
var can_move = true
var target = null
var base_y = 0.0         

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $Killzone

func _ready():
	base_y = position.y
	spawn()

func _process(delta: float) -> void:
	if target:
		update_can_move()
		update_look_direction()
		update_float_animation(delta)

	if can_move and is_at_base_height():
		position.x += direction * SPEED * delta

func spawn():
	visible = true
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		target = players[0]

func update_can_move():
	if not target:
		can_move = true
		return

	var player_pos = target.global_position
	var enemy_pos = global_position
	var sprite = target.get_node_or_null("AnimatedSprite2D")
	if not sprite:
		can_move = true
		return

	var distance = player_pos.distance_to(enemy_pos)
	if distance > VISIBLE_DISTANCE:
		can_move = true
		return

	var player_facing_right = not sprite.flip_h
	var is_to_right = enemy_pos.x > player_pos.x
	var is_to_left = enemy_pos.x < player_pos.x

	if (is_to_right and player_facing_right) or (is_to_left and not player_facing_right):
		can_move = false  # Freeze and float up
	else:
		can_move = true

func update_look_direction():
	if not target:
		return

	if target.global_position.x > global_position.x:
		animated_sprite.flip_h = false
		direction = 1
	else:
		animated_sprite.flip_h = true
		direction = -1

func update_float_animation(delta: float):
	var target_y = base_y
	
	if not can_move:
		target_y = base_y + FLOAT_HEIGHT

	var is_rising = target_y < position.y
	var speed = FLOAT_SPEED_RISE if is_rising else FLOAT_SPEED_FALL

	position.y = move_toward(position.y, target_y, speed)

func is_at_base_height() -> bool:
	return abs(position.y - base_y) < 0.5

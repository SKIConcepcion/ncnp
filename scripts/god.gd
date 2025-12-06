extends CharacterBody2D

@onready var target = null
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var fall_speed = -150
var initial_y = 0.0

func _ready():
	if get_tree().current_scene.name == "Afterlife" or Global.remove_god_proximity:
		queue_free()
		return

	initial_y = global_position.y 
	global_position.y = Global.god_position_y

func _physics_process(_delta: float) -> void:

	var hour = get_time()
	if hour >= 6 and hour < 18:
		fall_speed = -100
	elif (hour >= 18 and hour <= 23) or (hour >= 3 and hour < 6):
		fall_speed = -150
	elif hour >= 0 and hour < 3:
		fall_speed = -180
	else: 
		fall_speed = -150

	if Global.inside_shrine and Input.is_action_just_pressed("interact"):
		Global.god_position_y = initial_y
		global_position.y = initial_y

	if Global.awaken:
		velocity.y = fall_speed
	else:
		velocity.y = 0

	move_and_slide()

	Global.god_position_y = global_position.y

func get_time():
	var time_dict = Time.get_time_dict_from_system()
	return time_dict.hour

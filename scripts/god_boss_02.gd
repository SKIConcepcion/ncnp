extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var move_speed = 90.0
var hover_amplitude = 10.0
var hover_speed = 2.0

var direction = -1  # Start moving right to left

var left_bound = -1650.0
var right_bound = 350.0
var teleport_x = -2800.0

var original_y = 0.0
var hover_timer = 0.0

# Fade state
var fading = false
var fade_duration = 0.5
var fade_timer = 0.0
var fade_out = true

func _ready():
	original_y = global_position.y
	global_position.x = right_bound
	modulate.a = 1.0  # Fully visible
	adjust_move_speed_by_time()

func _physics_process(delta: float) -> void:
	if fading:
		handle_fade(delta)
		return

	hover_timer += delta

	# Move horizontally
	global_position.x += move_speed * direction * delta

	# Start fade out when reaching left bound (before teleport)
	if direction == -1 and global_position.x <= left_bound:
		start_fade_out()

	# Reverse when reaching right bound
	elif direction == 1 and global_position.x >= 700:
		start_fade_out()
		await get_tree().create_timer(1.0).timeout
		queue_free()
		return

	# Hover effect
	var hover_y = sin(hover_timer * hover_speed) * hover_amplitude
	global_position.y = original_y + hover_y

func start_fade_out():
	fading = true
	fade_out = true
	fade_timer = 0.0

func handle_fade(delta: float):
	fade_timer += delta
	var t = fade_timer / fade_duration

	if fade_out:
		modulate.a = lerp(1.0, 0.0, t)
		if t >= 1.0:
			global_position.x = teleport_x
			direction = 1  # After teleport, move left to right
			start_fade_in()
	else:
		modulate.a = lerp(0.0, 1.0, t)
		if t >= 1.0:
			fading = false

func start_fade_in():
	fade_out = false
	fade_timer = 0.0


func adjust_move_speed_by_time():
	var time = Time.get_time_dict_from_system()
	var hour = time["hour"]

	if hour >= 6 and hour < 18:
		move_speed = 88.0
	elif (hour >= 18 and hour <= 23) or (hour >= 3 and hour < 6):
		move_speed = 90.0
	elif hour >= 0 and hour < 3:
		move_speed = 92.0

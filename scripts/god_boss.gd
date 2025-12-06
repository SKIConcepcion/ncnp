extends CharacterBody2D

# Movement boundaries
var left_x = -1000.0
var right_x = -100.0

# Hover motion
var hover_amplitude = 10.0
var hover_speed = 2.0
var hover_timer = 0.0

# Horizontal movement
var move_speed = 80.0
var moving_right = true

# Vertical movement
var original_y = 0.0
var lowered_y = 0.0
var base_y = 0.0
var vertical_transition_speed = 80.0

# Vertical state control
enum VerticalState { NORMAL, LOWERED }
var vertical_state = VerticalState.NORMAL
var target_y = 0.0

# Timer for switching states
var state_timer = 0.0
var time_to_next_switch = 3.0

func _ready():
	adjust_hover_speed_by_time()
	original_y = global_position.y
	lowered_y = original_y + 260.0
	base_y = original_y
	target_y = original_y
	randomize()
	time_to_next_switch = randf_range(2.5, 5.0)

func _physics_process(delta: float) -> void:
	hover_timer += delta
	state_timer += delta

	# Random vertical state toggle based on time
	if state_timer >= time_to_next_switch:
		state_timer = 0.0
		time_to_next_switch = randf_range(2.5, 5.0)
		
		if vertical_state == VerticalState.NORMAL:
			vertical_state = VerticalState.LOWERED
			target_y = lowered_y
		else:
			vertical_state = VerticalState.NORMAL
			target_y = original_y

	# Smooth transition to target Y (either original or lowered)
	if abs(base_y - target_y) > 1.0:
		var direction = sign(target_y - base_y)
		base_y += direction * vertical_transition_speed * delta
		# Clamp overshoot
		if (direction > 0 and base_y > target_y) or (direction < 0 and base_y < target_y):
			base_y = target_y
	else:
		base_y = target_y  # snap to clean float value

	# Horizontal movement
	move_between(left_x, right_x, delta)

	# Apply hovering
	var hover_y = sin(hover_timer * hover_speed) * hover_amplitude
	global_position.y = base_y + hover_y

func move_between(left_bound: float, right_bound: float, delta: float) -> void:
	if moving_right:
		global_position.x += move_speed * delta
		if global_position.x >= right_bound:
			global_position.x = right_bound
			moving_right = false
	else:
		global_position.x -= move_speed * delta
		if global_position.x <= left_bound:
			global_position.x = left_bound
			moving_right = true


func adjust_hover_speed_by_time():
	var time = Time.get_time_dict_from_system()
	var hour = time["hour"]

	if hour >= 6 and hour < 18:
		move_speed = 75.0
	elif (hour >= 18 and hour <= 23) or (hour >= 3 and hour < 6):
		move_speed = 80.0
	elif hour >= 0 and hour < 3:
		move_speed = 90.0

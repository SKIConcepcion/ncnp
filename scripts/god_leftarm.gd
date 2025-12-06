extends CharacterBody2D

var left_bound_x = 0.0
var right_bound_x = 150.0

var drop_distance = 150.0
var drop_speed = 400.0
var rise_speed = 200.0
var move_speed = 130.0

var move_timer = 0.0
var move_interval = 1.5
var pause_duration = 0.5
var pause_timer = 0.0

var is_paused = false
var is_dropping = false
var is_rising = false
var moving_right = true

var original_y = 0.0


func _ready():
	original_y = global_position.y
	adjust_pause_duration_by_time()

func _physics_process(delta: float) -> void:
	
	# Move between two points smoothly
	if not is_paused and not is_dropping and not is_rising:
		move_timer += delta

		# Move toward target direction
		if moving_right:
			global_position.x += move_speed * delta
			if global_position.x >= right_bound_x:
				global_position.x = right_bound_x
				moving_right = false
		else:
			global_position.x -= move_speed * delta
			if global_position.x <= left_bound_x:
				global_position.x = left_bound_x
				moving_right = true

		# Time to pause and start drop sequence
		if move_timer > move_interval:
			is_paused = true
			pause_timer = 0.0

	# Pause before drop
	elif is_paused:
		pause_timer += delta
		if pause_timer >= pause_duration:
			is_paused = false
			is_dropping = true

	# Fast drop down
	elif is_dropping:
		global_position.y += drop_speed * delta
		if global_position.y >= original_y + drop_distance:
			global_position.y = original_y + drop_distance
			is_dropping = false
			is_rising = true

	# Slow rise back to original position
	elif is_rising:
		global_position.y -= rise_speed * delta
		if global_position.y <= original_y:
			global_position.y = original_y
			is_rising = false
			move_timer = 0.0
			move_interval = randf_range(1.0, 2.0)


func adjust_pause_duration_by_time():
	var time = Time.get_time_dict_from_system()
	var hour = time["hour"]

	if hour >= 6 and hour < 18:
		pause_duration = 0.8
	elif (hour >= 18 and hour <= 23) or (hour >= 3 and hour < 6):
		pause_duration = 0.6
	elif hour >= 0 and hour < 3:
		pause_duration = 0.5

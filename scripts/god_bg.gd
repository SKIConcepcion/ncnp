extends Sprite2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var hover_radius = 10.0
var hover_speed = 0.7
var move_speed = 70.0 

var origin_position: Vector2
var time_accumulator = 0.0

var delay_timer = 1.0
var moving_up = false
var hover_active = false
var target_y_offset = -2500.0  

var hover_timer = 0.0
var hover_duration = 3.0  # Time to hover before changing scene

func _ready() -> void:
	if Global.boss_battle_trigger:
		queue_free()
		return
		
	origin_position = global_position

func _process(delta: float) -> void:
	if delay_timer > 0.0:
		delay_timer -= delta
		return
	
	if !hover_active and !moving_up:
		moving_up = true
	
	if moving_up:
		var target_position = origin_position + Vector2(0, target_y_offset)
		global_position = global_position.move_toward(target_position, move_speed * delta)
		
		if global_position.distance_to(target_position) < 1.0:
			# Finished moving up
			origin_position = target_position
			global_position = target_position
			moving_up = false
			hover_active = true
	
	elif hover_active:
		# Hover effect
		time_accumulator += delta * hover_speed
		var offset_x = sin(time_accumulator * 1.5) * hover_radius
		var offset_y = cos(time_accumulator * 2.0) * hover_radius
		global_position = origin_position + Vector2(offset_x, offset_y)

		# Start hover timer
		hover_timer += delta
		if hover_timer >= hover_duration:
			ScreenTrans.change_scene("res://scenes/screens/ending_sequence/ending_sequence_01.tscn")

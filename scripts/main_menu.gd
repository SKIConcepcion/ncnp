extends Control

@onready var time_label: Label = $Time/TimeLabel
@onready var difficulty_label: Label = $Difficulty/DifficultyLabel


func _ready() -> void:
	var current_time = Time.get_time_dict_from_system()
	var hour = current_time.hour

	var hour_12 = hour % 12
	if hour_12 == 0:
		hour_12 = 12

	var am_pm = "AM" if hour < 12 else "PM"
	var hour_str = str(hour_12).pad_zeros(2)
	var minute_str = str(current_time.minute).pad_zeros(2)

	time_label.text = hour_str + ":" + minute_str + " " + am_pm


	# Determine difficulty based on hour
	var difficulty_mode = ""
	var fall_speed = 0

	if hour >= 6 and hour < 18:
		difficulty_mode = "Easy"
		fall_speed = -100
	elif (hour >= 18 and hour <= 23) or (hour >= 3 and hour < 6):
		difficulty_mode = "Medium"
		fall_speed = -120
	elif hour >= 0 and hour < 3:
		difficulty_mode = "Hard"
		fall_speed = -150

	# Set difficulty text
	difficulty_label.text = difficulty_mode

	# Your existing music logic
	if !GlobalSfx.jazz_playing:
		GlobalSfx.play_jazz_music()
		GlobalSfx.jazz_playing = true

func _on_start_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	ScreenTrans.change_scene("res://scenes/screens/control_screen.tscn")

func _on_credit_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	ScreenTrans.change_scene("res://scenes/screens/credit_screen.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

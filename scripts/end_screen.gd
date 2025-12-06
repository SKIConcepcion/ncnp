extends Control

@onready var label: Label = $Label

func _ready() -> void:
	var current_date = Time.get_date_dict_from_system()
	var month_names = [
		"January", "February", "March", "April", "May", "June",
		"July", "August", "September", "October", "November", "December"
	]
	var formatted_date = "%s %02d, %d" % [
		month_names[current_date.month - 1],
		current_date.day,
		current_date.year
	]
	label.text = formatted_date

func _on_continue_pressed() -> void:
	GlobalSfx.play_paper_sfx()
	ScreenTrans.change_scene("res://scenes/screens/endings/canon_ending.tscn")

extends Control

func _on_continue_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	Global.reset()
	ScreenTrans.change_scene("res://scenes/screens/main_menu.tscn", 2)

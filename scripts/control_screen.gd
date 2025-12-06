extends Control

func _on_continue_pressed() -> void:
	GlobalSfx.play_paper_sfx()
	ScreenTrans.change_scene("res://scenes/screens/start_screen.tscn")

func _on_back_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	ScreenTrans.change_scene("res://scenes/screens/main_menu.tscn")

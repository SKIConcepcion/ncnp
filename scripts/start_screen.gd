extends Control

func _on_continue_pressed() -> void:
	GlobalSfx.play_paper_sfx()
	ScreenTrans.change_scene("res://scenes/screens/quote_screen.tscn")

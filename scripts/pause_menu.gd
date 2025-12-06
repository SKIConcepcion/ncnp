extends Control

@onready var pause_menu: Control = $"."

func show_pause_menu():
	pause_menu.visible = true
	get_tree().paused = true

func hide_pause_menu():
	pause_menu.visible = false
	get_tree().paused = false


func _on_resume_pressed() -> void:
	hide_pause_menu()


func _on_exit_pressed() -> void:
	ScreenTrans.change_scene("res://scenes/screens/main_menu.tscn")

extends Control

@onready var option_01: Button = $ColorRect/Option_01

func _ready() -> void:
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	option_01.visible = true


func _on_option_01_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	GlobalSfx.stop_jazz_music()
	Global.well_open = true
	Global.objective = "seek answers beneath the well"
	Global.spawn_position = Vector2(30, -90)
	ScreenTrans.change_scene("res://scenes/areas/lantern_room.tscn")

extends Control

@onready var option_01: Button = $ColorRect/Option_01
@onready var option_02: Button = $ColorRect/Option_02

func _ready() -> void:
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	option_01.visible = true
	option_02.visible = true


func _on_option_01_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	GlobalSfx.stop_jazz_music_sudden()
	ScreenTrans.change_scene("res://scenes/screens/endings/no_story_ending.tscn", 2)


func _on_option_02_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	GlobalSfx.stop_jazz_music()
	Global.spawn_position = Vector2(0, 0)
	ScreenTrans.change_scene("res://scenes/areas/passage.tscn")

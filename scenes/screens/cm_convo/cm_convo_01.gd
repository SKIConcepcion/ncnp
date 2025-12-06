extends Control

@onready var option_01: Button = $ColorRect/Option_01
@onready var option_02: Button = $ColorRect/Option_02

func _ready() -> void:
	GlobalSfx.play_jazz_music()
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	option_01.visible = true
	option_02.visible = true


func _on_option_01_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	ScreenTrans.change_scene("res://scenes/screens/cm_convo/cm_convo_02.tscn")


func _on_option_02_pressed() -> void:
	GlobalSfx.play_flashlight_sfx()
	ScreenTrans.change_scene("res://scenes/screens/cm_convo/cm_convo_02.tscn")

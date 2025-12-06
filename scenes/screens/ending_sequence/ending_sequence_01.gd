extends Control

func _ready() -> void:
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(3).timeout
	ScreenTrans.change_scene("res://scenes/screens/ending_sequence/ending_sequence_02.tscn")

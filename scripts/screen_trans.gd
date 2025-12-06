extends CanvasLayer

func change_scene(target: String, delay: int = 0) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(delay).timeout
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")

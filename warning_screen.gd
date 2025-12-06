extends Control

func _ready() -> void:
	Global.checkpoint_one_trigger = true
	$AnimationPlayer.play("show")
	var timer = Timer.new()
	timer.wait_time = 5.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout) 
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	Global.spawn_position = Vector2(9065, -330)
	GlobalSfx.play_door_sfx()
	ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")
	print(Global.removed_text_nodes)

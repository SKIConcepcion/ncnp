extends Control

func _ready() -> void:
	$AnimationPlayer.play("show")
	var timer = Timer.new()
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout) 
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	if Global.checkpoint_three_trigger:
		ScreenTrans.change_scene("res://scenes/areas/cabin_01.tscn")
	elif Global.checkpoint_two_trigger:
		ScreenTrans.change_scene("res://scenes/areas/cabin_01.tscn")
	elif Global.checkpoint_three_trigger:
		ScreenTrans.change_scene("res://scenes/areas/cabin_01.tscn")

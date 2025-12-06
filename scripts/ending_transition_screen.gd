extends Control

func _ready() -> void:
	$AnimationPlayer.play("show")
	var timer = Timer.new()
	timer.wait_time = 4.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout) 
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	Global.spawn_position = Vector2(0, 0)
	ScreenTrans.change_scene("res://scenes/areas/home.tscn", 3)

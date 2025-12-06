extends Control

func _ready() -> void:
	GlobalSfx.stop_jazz_music()
	GlobalSfx.jazz_playing = false
	
	var timer = Timer.new()
	timer.wait_time = 6.0
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout) 
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	ScreenTrans.change_scene("res://scenes/areas/main.tscn", 2)

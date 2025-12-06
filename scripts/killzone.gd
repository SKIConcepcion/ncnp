extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.spawn_position = Vector2(0, 0)
		Global.objective = "remember"
		ScreenOver.change_scene("res://scenes/areas/afterlife.tscn")

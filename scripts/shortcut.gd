extends Area2D

var entered = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		entered = true

func _on_body_exited(body) -> void:
	if body.name == "Player":
		entered = false

func _process(_delta: float) -> void:
	if entered and Input.is_action_just_pressed("interact"):
		var players = get_tree().get_nodes_in_group("player")
		if players.size() > 0:
			var player = players[0]
			
			match self.name:
				"Shortcut01":
					player.global_position = Vector2(366, 272)
				"Shortcut02":
					player.global_position = Vector2(344, 397)
				"Shortcut03":
					player.global_position = Vector2(460, 113)
				"Shortcut04":
					player.global_position = Vector2(444, 270)
				"Shortcut05":
					player.global_position = Vector2(-240, -6)
				"Shortcut06":
					player.global_position = Vector2(-260, 111)
				"Shortcut07":
					player.global_position = Vector2(-300, 214)
				"Shortcut08":
					player.global_position = Vector2(-284, 630)
				"Shortcut09":
					player.global_position = Vector2(1426, -210)
				"Shortcut10":
					player.global_position = Vector2(1463,290)
				"Shortcut11":
					player.global_position = Vector2(537, -201)
				"Shortcut12":
					player.global_position = Vector2(547, 49)

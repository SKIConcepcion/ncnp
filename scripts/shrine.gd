extends Area2D

var shrine_entered = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		shrine_entered = true
		Global.inside_shrine = true
		$Label.visible = true 
		$Sprite2D.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		shrine_entered = false
		Global.inside_shrine = false
		$Label.visible = false 
		$Sprite2D.visible = false

func _process(_delta: float) -> void:
	if shrine_entered and Input.is_action_just_pressed("interact"):
		GlobalSfx.play_prayer_sfx()

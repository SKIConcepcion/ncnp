extends Area2D

@onready var rope: Sprite2D = $Sprite2D
var player_inside := false

func _ready() -> void:
	if Global.has_rope or Global.rope_used:
		rope.visible = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body) -> void:
	if body.name == "Player":
		player_inside = false

func _process(delta):
	if player_inside and !Global.rope_used:
		if Input.is_action_just_pressed("interact"):
			Global.has_rope = true
			rope.visible = false
			Global.objective = "investigate the maze cave (under hanging bridge)"

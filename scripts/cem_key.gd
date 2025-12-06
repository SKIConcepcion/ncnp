extends Area2D

@onready var cem_key: Sprite2D = $Sprite2D
var player_inside := false

func _ready() -> void:
	if Global.has_cem_key or Global.cem_key_used:
		cem_key.visible = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body) -> void:
	if body.name == "Player":
		player_inside = false

func _process(delta):
	if player_inside and !Global.cem_key_used:
		if Input.is_action_just_pressed("interact"):
			Global.has_cem_key = true
			cem_key.visible = false
			Global.objective = "go to the cemetery"

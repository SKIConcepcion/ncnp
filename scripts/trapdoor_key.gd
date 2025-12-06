extends Area2D

@onready var trapdoor_key: Sprite2D = $Sprite2D
var player_inside := false

func _ready() -> void:
	if Global.has_trapdoor_key or Global.trapdoor_key_used:
		trapdoor_key.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false

func _process(_delta):
	if player_inside and !Global.trapdoor_key_used:
		if Input.is_action_just_pressed("interact"):
			Global.has_trapdoor_key = true
			trapdoor_key.visible = false
			Global.objective = "reach the church bell"

extends Area2D

@onready var lighthouse_key: Sprite2D = $Sprite2D
var player_inside := false

func _ready() -> void:
	if Global.has_lighthouse_key or Global.lighthouse_key_used:
		lighthouse_key.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false

func _process(_delta):
	if player_inside and !Global.lighthouse_key_used:
		if Input.is_action_just_pressed("interact"):
			Global.objective = "go to the lighthouse"
			Global.has_lighthouse_key = true
			lighthouse_key.visible = false

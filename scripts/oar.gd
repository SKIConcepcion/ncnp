extends Area2D

@onready var oar: Sprite2D = $Sprite2D
var player_inside := false

func _ready() -> void:
	if Global.has_oar or Global.oar_used:
		oar.visible = false

func _on_body_entered(body) -> void:
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body) -> void:
	if body.name == "Player":
		player_inside = false

func _process(delta):
	if player_inside and !Global.oar_used:
		if Input.is_action_just_pressed("interact"):
			Global.has_oar = true
			oar.visible = false

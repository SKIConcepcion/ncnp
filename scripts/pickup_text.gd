extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var player_in_area := false
var can_pick_up := false

func _ready():
	$Area2D.body_entered.connect(_on_body_pickup_entered)
	$Area2D.body_exited.connect(_on_body_pickup_exited)
	$Label.visible = false 
	$Sprite2D.visible = false

func _on_body_pickup_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		var text = ""

		match self.name:
			"oar":
				if Global.oar_used or Global.has_oar:
					self.visible = false
					can_pick_up = false
				else:
					text = "Pick Up Oar"
					can_pick_up = true

			"cem_key":
				if Global.cem_key_used or Global.has_cem_key:
					self.visible = false
					can_pick_up = false
				else:
					sprite_2d.scale.x = 0.6
					text = "Pick Up Cemetery Key"
					can_pick_up = true

			"altar_key":
				if Global.altar_key_used or Global.has_altar_key:
					self.visible = false
					can_pick_up = false
				else:
					sprite_2d.scale.x = 0.6
					text = "Pick Up Altar Key"
					can_pick_up = true


			"trapdoor_key":
				if Global.trapdoor_key_used or Global.has_trapdoor_key:
					self.visible = false
					can_pick_up = false
				else:
					sprite_2d.scale.x = 0.6
					text = "Pick Up Altar Key"
					can_pick_up = true


			"rope":
				if Global.rope_used or Global.has_rope:
					self.visible = false
					can_pick_up = false
				else:
					text = "Pick Up Rope"
					can_pick_up = true


			"lighthouse_key":
				if Global.lighthouse_key_used or Global.has_lighthouse_key:
					self.visible = false
					can_pick_up = false
				else:
					sprite_2d.scale.x = 0.6
					text = "Pick Up Lighthouse Key"
					can_pick_up = true


			"unknown_key":
				if Global.unknown_key_used or Global.has_unknown_key:
					self.visible = false
					can_pick_up = false
				else:
					sprite_2d.scale.x = 0.6
					text = "Pick Up Unknown Key"
					can_pick_up = true


			"well_cabin_key":
				if Global.well_cabin_key_used or Global.has_well_cabin_key:
					self.visible = false
					can_pick_up = false
				else:
					if Global.riddle_trigger:
						sprite_2d.scale.x = 0.6
						text = "Pick Up Well Cabin Key"
						can_pick_up = true
					else:
						self.visible = false
						can_pick_up = false

		$Label.text = text
		$Label.visible = true
		$Sprite2D.visible = true

func _on_body_pickup_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		can_pick_up = false
		$Label.visible = false
		$Sprite2D.visible = false

func _process(_delta):
	if player_in_area and can_pick_up and Input.is_action_just_pressed("interact"):
		GlobalSfx.play_pickup_sfx()
		self.visible = false
		can_pick_up = false

extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	$Label.visible = false 
	$Sprite2D.visible = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		
		var text = ""
		
		match self.name:

			"grave":
				text = "Reminisce?"
			"read_note":
				text = "Read note"
			"read_torn_page":
				text = "Read torn page"
			"end":
				text = "End?"
			"chicken":
				text = "Chicken"
				
			"cabin_door":
				text = "Enter Cabin"
			"cabin_door_02":
				if Global.awaken:
					text = "Restricted"
				else: 
					text = "Enter Cabin"
			"boathouse_door":
				text = "Enter Boathouse"
			"boathouse_out":
				text = "Exit Boathouse"
			"cabin_out":
				text = "Exit Cabin"
			"boat_back":
				text = "Use Boat"
			"boat_use":
				if Global.has_oar or Global.oar_used:
					text = "Use Boat"
				else:
					text = "Requires oar"


			"cave_out":
				text = "Exit Cave"
			"cave_out_02":
				text = "Exit Cave"


			"vlg_door":
				text = "Locked"
			"vlg_door_02":
				text = "Locked"
			"vlg_door_03":
				text = "Locked"
			"vlg_door_04":
				text = "Locked"
			"vlg_door_05":
				text = "Locked"
			"vlg_door_06":
				text = "Locked"


			"cave_iron_door":
				text = "Locked"
			"cave_drop":
				if Global.has_rope or Global.rope_used:
					text = "Descent"
				else:
					text = "Requires rope"
			"ascent":
				text = "Climb rope"

			"cave_door":
				text = "Enter Cave"
			"cave_door_02":
				text = "Enter Cave"
			"cave_door_03":
				text = "Enter Cave"
			"cave_door_04":
				text = "Enter Cave"
			"cave_door_05":
				text = "Enter Cave"
			"cave_door_06":
				text = "Enter Cave"
			"cave_door_07":
				text = "Enter Cave"
			"cemetery_door":
				if Global.has_cem_key or Global.cem_key_used:
					text = "Enter Cemetery"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires cemetery key"
			"church_door":
				if Global.church_open:
					text = "Enter Church"
				else:
					text = "Locked"
			"church_out":
				text = "Exit Church"
			"church_hallway_in":
				text = "Enter Hallway"
			"church_hallway_out":
				text = "Exit Hallway"
			"church_hallway_out_02":
				if Global.has_altar_key or Global.altar_key_used:
					text = "Enter Altar"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires altar key"
			"church_hallway_out_03":
				text = "Enter Bell Tower"
			"church_tower_out":
				text = "Exit Bell Tower"
			"church_tower_out_02":
				if Global.has_trapdoor_key or Global.trapdoor_key_used:
					sprite_2d.scale.x = 0.6
					text = "Enter Church Bell Room"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires bell tower key"
			"church_altar_in":
				sprite_2d.scale.x = 0.5
				text = "Enter Church Altar"
			"church_bell_out":
					sprite_2d.scale.x = 0.6
					text = "Exit Church Bell Room"

			"cemetery_left_out":
				sprite_2d.scale.x = 0.5
				text = "Exit Cemetery"
				
			"use_rope":
				text = "Use rope"
			"use_rope_02":
				text = "Use rope"
			"use_rope_03":
				text = "Use rope"
			"use_rope_04":
				text = "Use rope"
			"use_rope_05":
				text = "Use rope"
			"use_rope_06":
				text = "Use rope"
			"use_rope_07":
				text = "Use rope"
			"use_rope_08":
				text = "Use rope"
			"use_rope_09":
				text = "Use rope"
			"use_rope_10":
				text = "Use rope"

			"maze_cave_in":
				text = "Enter Maze Cave"
			"maze_cave_out":
				text = "Exit Maze Cave"
			"view_map":
				text = "View map"

			"lighthouse_door":
				if Global.has_lighthouse_key or Global.lighthouse_key_used:
					text = "Enter Lighthouse"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires lighthouse key"

			"lighthouse_out":
				text = "Exit Lighthouse"

			"lantern_room_in":
				text = "Enter Lantern Room"

			"lantern_room_out":
				text = "Exit Lantern Room"

			"convo_cm":
				text = "Talk to Elian"

			"convo_guinto":
				if !Global.well_open:
					text = "Talk to Mr. Guinto"
				else:
					queue_free()


			"well_in":
				if !Global.well_open:
					queue_free()
				else:
					text = "Descend"

			"well_out":
				text = "Exit Well"

			"well_01_in":
				text = "Enter Well Cave"

			"well_01_out":
				text = "Exit Well Cave"
				
			"well_02_in":
				sprite_2d.scale.x = 0.3
				text = "Enter"

			"well_02_out":
				sprite_2d.scale.x = 0.3
				text = "Exit"

			"well_03_in":
				sprite_2d.scale.x = 0.3
				text = "Enter"

			"well_03_out":
				sprite_2d.scale.x = 0.3
				text = "Exit"

			"well_cabin_in":
				if Global.has_well_cabin_key or Global.well_cabin_key_used:
					text = "Enter Well Cabin"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires well cabin key"

			"view_riddle":
				text = "View riddle clue"

			"well_cabin_out":
				text = "Exit Well Cabin"

			"well_altar_in":
				text = "Enter Well Altar"

			"well_altar_out":
				text = "Locked"

			"well_cabin_main_in":
				text = "Exit Well Cabin"

			"well_cabin_main_out":
				if !Global.well_cabin_unlocked:
					sprite_2d.scale.x = 0.8
					text = "Locked from the other side"
				else:
					text = "Enter Well Cabin"



			"locked_door":
				sprite_2d.scale.x = 0.3
				text = "Locked"

			"pre_boss_door":
				if !Global.boss_battle_trigger:
					sprite_2d.scale.x = 0.3
					text = "Locked"
				else:
					text = "Enter"

			"boss_door":
				sprite_2d.scale.x = 0.3
				text = "Escape"

			"final_boss_door":
				if !Global.ending_trigger:
					sprite_2d.scale.x = 0.3
					text = "Locked"
				else:
					text = "Escape"

			"god_convo":
				if !Global.ending_trigger:
					sprite_2d.scale.x = 0.4
					text = "Confront “god”"
				else:
					queue_free()

			"unknown_door":
				if Global.has_unknown_key or Global.unknown_key_used:
					sprite_2d.scale.x = 0.3
					text = "Enter"
				else:
					sprite_2d.scale.x = 0.6
					text = "Requires unknown key"

			"home_way":
				sprite_2d.scale.x = 0.4
				text = "Go Home"

			"write_story":
				text = "Write a story"

		$Label.text = text
		$Label.visible = true
		$Sprite2D.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$Label.visible = false
		$Sprite2D.visible = false

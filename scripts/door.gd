extends Area2D

var entered = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		entered = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		entered = false

func _process(_delta: float) -> void:


	if self.name == "Grave" and entered and Input.is_action_just_pressed("interact"):
		if Global.checkpoint_five_trigger:
			Global.checkpoint_five()
			ScreenOver.change_scene("res://scenes/areas/well_cave_pre_boss.tscn")
			
		elif Global.checkpoint_four_trigger:
			Global.checkpoint_four()
			ScreenOver.change_scene("res://scenes/areas/well.tscn")
			
		elif Global.checkpoint_three_trigger:
			Global.checkpoint_three()
			ScreenOver.change_scene("res://scenes/areas/maze_cave_01_alt.tscn")

		elif Global.checkpoint_two_trigger:
			Global.checkpoint_two()
			ScreenOver.change_scene("res://scenes/areas/church_04.tscn")
			
		elif Global.checkpoint_one_trigger:
			Global.checkpoint_one()
			ScreenOver.change_scene("res://scenes/areas/cabin_02.tscn")
		
		else:
			Global.reset()
			ScreenOver.change_scene("res://scenes/areas/main.tscn")


	if self.name == "End" and entered and Input.is_action_just_pressed("interact"):
		Global.reset()
		ScreenOver.change_scene("res://scenes/screens/endings/bad_ending.tscn")


	##### MAIN 01 #####
	if self.name == "CabinDoorIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/cabin_01.tscn")


	if self.name == "CabinDoorOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(1325, 2)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/main.tscn")


	if self.name == "BoathouseDoorIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(72, 2)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/boat_house_01.tscn")


	if self.name == "BoathouseDoorOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(3472, 442)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/main.tscn")


	if self.name == "PassageWay":
		if entered and Input.is_action_just_pressed("interact") and Global.oar_used:
			Global.spawn_position = Vector2(0, 0)
			ScreenTrans.change_scene("res://scenes/areas/passage.tscn")
		
		if entered and Input.is_action_just_pressed("interact") and Global.has_oar:
			Global.objective = "investigate the town"
			Global.spawn_position = Vector2(0, 0)
			ScreenTrans.change_scene("res://scenes/areas/boat_ride.tscn")
			Global.has_oar = false





	##### PASSAGE #####
	if self.name == "Main01Way" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(3789, 482)
		ScreenTrans.change_scene("res://scenes/areas/main.tscn")


	if self.name == "PassageCaveLeftIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/areas/passage_cave.tscn")


	if self.name == "PassageCaveLeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(1328, 34)
		
		if !Global.awaken:
			ScreenTrans.change_scene("res://scenes/areas/passage.tscn")
		else:
			ScreenTrans.change_scene("res://scenes/areas/passage_alt.tscn")

	if self.name == "PassageCaveRightOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")





	##### CEMETERY #####
	if self.name == "CemeteryLeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(1203, -70)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")




	##### MAIN 02 #####
	if self.name == "PassageCaveRightIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(305, -62)
		ScreenTrans.change_scene("res://scenes/areas/passage_cave.tscn")


	if self.name == "CemeteryIn":
		if entered and Input.is_action_just_pressed("interact") and Global.cem_key_used:
			Global.spawn_position = Vector2(150, 0)
			GlobalSfx.play_gate_sfx()
			ScreenTrans.change_scene("res://scenes/areas/cemetery_01.tscn")
		
		if entered and Input.is_action_just_pressed("interact") and Global.has_cem_key:
			Global.objective = "investigate the boat"
			Global.has_cem_key = false
			Global.cem_key_used = true
				
			Global.spawn_position = Vector2(150, 0)
			GlobalSfx.play_gate_sfx()
			ScreenTrans.change_scene("res://scenes/areas/cemetery_01.tscn")


	if self.name == "Cave01LeftIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-11, 2)
		ScreenTrans.change_scene("res://scenes/areas/cave_01.tscn")


	if self.name == "Cave01LeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(2095, 129)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")


	if self.name == "Cave01RightIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(465, 162)
		ScreenTrans.change_scene("res://scenes/areas/cave_01.tscn")


	if self.name == "Cave01RightOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(2575, 289)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")


	if self.name == "ChurchDoor" and entered and Global.church_open and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(16, 0)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_01.tscn")


	if self.name == "ChurchDoorOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(4600, -252)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")


	if self.name == "ChurchHallwayDoor" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_02.tscn")


	if self.name == "ChurchHallwayOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(816, -56)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_01.tscn")


	if self.name == "ChurchHallwayOut02":
		if entered and Input.is_action_just_pressed("interact") and Global.altar_key_used:
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/church_04.tscn")
		
		if entered and Input.is_action_just_pressed("interact") and Global.has_altar_key:
			Global.checkpoint_two_trigger = true
			Global.has_altar_key = false
			Global.altar_key_used = true
				
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/church_04.tscn")


	if self.name == "ChurchHallwayOut03" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(48, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_03.tscn")


	if self.name == "ChurchBellIn":
		if entered and Input.is_action_just_pressed("interact") and Global.trapdoor_key_used:
			Global.spawn_position = Vector2(-80, -8)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/church_05.tscn")
		
		if entered and Input.is_action_just_pressed("interact") and Global.has_trapdoor_key:
			Global.has_trapdoor_key = false
			Global.trapdoor_key_used = true
				
			Global.spawn_position = Vector2(-80, -8)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/church_05.tscn")


	if self.name == "ChurchBellOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-79, -326)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_03.tscn")


	if self.name == "ChurchTowerOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(750, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_02.tscn")


	if self.name == "ChurchAltarLeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(368, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_02.tscn")


	if self.name == "ChurchAltarRightOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(591, -300)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/cave_02.tscn")



	if self.name == "Cave02DownIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/areas/cave_02.tscn")


	if self.name == "Cave02DownOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(4592, -46)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")


	if self.name == "Cave02UpOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(426, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/church_04.tscn")


	if self.name == "Cave03LeftIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		Global.cave_3_left_enter = true
		ScreenTrans.change_scene("res://scenes/areas/cave_03.tscn")	

	if self.name == "Cave03LeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(7790, -628)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")	

	if self.name == "Cave03RightIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(2416, -54)
		Global.cave_3_left_enter = false
		ScreenTrans.change_scene("res://scenes/areas/cave_03.tscn")			

	if self.name == "Cave03RightOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(8699, -382)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")	

	if self.name == "CabinDoor2In" and entered and Input.is_action_just_pressed("interact"):
		if !Global.awaken:
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/cabin_02.tscn")


	if self.name == "CabinDoor2Out" and entered and Input.is_action_just_pressed("interact"):
		if Global.trigger_awaken and !Global.triggered:
			Global.awaken = true
			Global.triggered = true
			ScreenTrans.change_scene("res://scenes/screens/warning_screen.tscn")

		else:
			Global.spawn_position = Vector2(9065, -330)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")

	if self.name == "MazeCaveIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		
		if Global.rope_used:
			ScreenTrans.change_scene("res://scenes/areas/maze_cave_01_alt.tscn")
		else:
			ScreenTrans.change_scene("res://scenes/areas/maze_cave_01.tscn")

	if self.name == "MazeCaveOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(5200, 0)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")
		
	if self.name == "MazeCave02In":
		if entered and Input.is_action_just_pressed("interact") and Global.rope_used:
			Global.spawn_position = Vector2(-10, 0)
			ScreenTrans.change_scene("res://scenes/areas/maze_cave_02.tscn")

		if entered and Input.is_action_just_pressed("interact") and Global.has_rope:
			Global.has_rope = false
			Global.rope_used = true
				
			Global.spawn_position = Vector2(-10, 0)
			ScreenTrans.change_scene("res://scenes/areas/maze_cave_02.tscn")
			
	if self.name == "MazeCave02LeftOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(236, 3)
		ScreenTrans.change_scene("res://scenes/areas/maze_cave_01_alt.tscn")

	if self.name == "MazeCave02RightOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(751, 46)
		ScreenTrans.change_scene("res://scenes/areas/maze_cave_01_alt.tscn")
		if !Global.checkpoint_three_trigger:
			Global.checkpoint_three_trigger = true
		
	if self.name == "MazeCave02In2" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(978, -337)
		ScreenTrans.change_scene("res://scenes/areas/maze_cave_02.tscn")

	if self.name == "MazeCaveIn2" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(432, -207)
		ScreenTrans.change_scene("res://scenes/areas/maze_cave_01_alt.tscn")

	if self.name == "MazeCaveOut2" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(5712, -176)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")

	if self.name == "LighthouseIn":
		if entered and Input.is_action_just_pressed("interact") and Global.lighthouse_key_used:
			Global.spawn_position = Vector2(-15, 0)
			GlobalSfx.play_door_sfx()
			
			if Global.well_open:
				ScreenTrans.change_scene("res://scenes/areas/lighthouse_01_alt.tscn")
			else:
				ScreenTrans.change_scene("res://scenes/areas/lighthouse_01.tscn")

		if entered and Input.is_action_just_pressed("interact") and Global.has_lighthouse_key:
			Global.objective = "enter the lantern room"
			Global.has_lighthouse_key = false
			Global.lighthouse_key_used = true
				
			Global.spawn_position = Vector2(-15, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/lighthouse_01.tscn")

	if self.name == "LighthouseOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(9985, -210)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")


	if self.name == "LanternRoomIn" and entered and Input.is_action_just_pressed("interact"):
		
		if Global.objective == "enter the lantern room":
			Global.objective = "talk to Mr. Guinto"
		
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/lantern_room.tscn")

	if self.name == "LanternRoomOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-15, -585)
		GlobalSfx.play_door_sfx()
		
		if Global.well_open:
			ScreenTrans.change_scene("res://scenes/areas/lighthouse_01_alt.tscn")
		else:
			ScreenTrans.change_scene("res://scenes/areas/lighthouse_01.tscn")


	if self.name == "TriggerConvoGuinto" and entered and Input.is_action_just_pressed("interact"):
		if !Global.well_open:
			ScreenTrans.change_scene("res://scenes/screens/guinto_convo/guinto_convo_01.tscn",1)

	if self.name == "TriggerConvoCm" and entered and Input.is_action_just_pressed("interact"):
		Global.oar_used = true
		ScreenTrans.change_scene("res://scenes/screens/cm_convo/cm_convo_01.tscn",1)
		
	if self.name == "WellIn" and entered and Input.is_action_just_pressed("interact"):
		if Global.well_open:
			Global.spawn_position = Vector2(0, 0)
			ScreenTrans.change_scene("res://scenes/areas/well.tscn")
			
			if !Global.checkpoint_four_trigger:
				Global.checkpoint_four_trigger = true
			
	if self.name == "WellOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(3328, -80)
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")

	if self.name == "Well01In" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-10, 0)
		ScreenTrans.change_scene("res://scenes/areas/well_cave_01.tscn")

	if self.name == "Well01Out" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(113, 0)
		ScreenTrans.change_scene("res://scenes/areas/well.tscn")

	if self.name == "Well02In" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/areas/well_cave_02.tscn")

	if self.name == "Well02Out" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-334, 144)
		ScreenTrans.change_scene("res://scenes/areas/well_cave_01.tscn")

	if self.name == "Well03In" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/areas/well_cave_03.tscn")

	if self.name == "Well03Out" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(721, -43)
		ScreenTrans.change_scene("res://scenes/areas/well_cave_02.tscn")

	if self.name == "WellCabinIn":
		if entered and Input.is_action_just_pressed("interact") and Global.well_cabin_key_used:
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/well_cabin_01.tscn")

		if entered and Input.is_action_just_pressed("interact") and Global.has_well_cabin_key:
			Global.objective = "?"
			Global.has_well_cabin_key = false
			Global.well_cabin_key_used = true
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/well_cabin_01.tscn")

	if self.name == "WellCabinOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(529, 5)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_03.tscn")

	if self.name == "WellAltarIn" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(730, -30)
		GlobalSfx.play_door_sfx()
		Global.objective = "confront “god”"
		ScreenTrans.change_scene("res://scenes/areas/well_altar.tscn")

	if self.name == "WellAltarOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(804, -32)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cabin_01.tscn")



	if self.name == "WellCabinMainIn" and entered and Input.is_action_just_pressed("interact"):
		Global.well_cabin_unlocked = true
		Global.spawn_position = Vector2(4336, 175)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/main_02.tscn")

	if self.name == "WellCabinMainOut":
		if entered and Input.is_action_just_pressed("interact") and Global.well_cabin_unlocked:
			Global.spawn_position = Vector2(520, -30)
			GlobalSfx.play_door_sfx()
			ScreenTrans.change_scene("res://scenes/areas/well_cabin_01.tscn")




	if self.name == "PreBossDoor":
		if entered and Input.is_action_just_pressed("interact") and Global.boss_battle_trigger:
			Global.checkpoint_five_trigger = true
			Global.spawn_position = Vector2(0, 0)
			GlobalSfx.play_gate_sfx()
			ScreenTrans.change_scene("res://scenes/areas/well_cave_pre_boss.tscn")

	if self.name == "Boss01Door" and entered and Input.is_action_just_pressed("interact"):
		GlobalSfx.play_god_sfx()
		ScreenTrans.change_scene("res://scenes/screens/judgement_screen.tscn")

	if self.name == "Boss02Door" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "defy “god's” eye"
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_05.tscn")

	if self.name == "Boss03Door" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "defy “god”"
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_06.tscn")

	if self.name == "Boss04Door" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "?"
		Global.spawn_position = Vector2(224, -26)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_07.tscn")

	if self.name == "PostBossDoor" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "escape"
		Global.spawn_position = Vector2(320, -44)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_08.tscn")

	if self.name == "TriggerConvoGod" and entered and Input.is_action_just_pressed("interact"):
		ScreenTrans.change_scene("res://scenes/screens/ending_sequence/ending_sequence_04.tscn", 1)




	if self.name == "PassageIn" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "go home"
		Global.spawn_position = Vector2(382, 100)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/passage_alt.tscn")

	if self.name == "PassageOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(287, -1019)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_08.tscn")


	if self.name == "HomeWay" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(0, 0)
		ScreenTrans.change_scene("res://scenes/screens/ending_transition_screen.tscn", 3)

	if self.name == "WriteStory" and entered and Input.is_action_just_pressed("interact"):
		ScreenTrans.change_scene("res://scenes/screens/end_screen.tscn", 2)


	if self.name == "PlaytesterPortal" and entered and Input.is_action_just_pressed("interact"):
		Global.objective = "?"
		Global.spawn_position = Vector2(0, 0)
		GlobalSfx.play_door_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cabin_01.tscn")



	if self.name == "UnknownIn":
		if entered and Input.is_action_just_pressed("interact") and Global.has_unknown_key:
			Global.has_unknown_key = false
			Global.unknown_key_used = true
			Global.spawn_position = Vector2(-163, -56)
			GlobalSfx.play_gate_sfx()
			ScreenTrans.change_scene("res://scenes/areas/unknown_cave.tscn")

	if self.name == "UnknownOut" and entered and Input.is_action_just_pressed("interact"):
		Global.spawn_position = Vector2(-97, -504)
		GlobalSfx.play_gate_sfx()
		ScreenTrans.change_scene("res://scenes/areas/well_cave_08.tscn")

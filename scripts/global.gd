extends Node

var spawn_position := Vector2(0, 0)
var objective = "go to the other town"

var removed_text_nodes = {}

### EVENT HANDLERS
var awaken = false
var god_awaken = false
var church_open = false
var well_open = false
var cave_3_left_enter = true
var trigger_awaken = false
var triggered = false
var inside_shrine = false
var riddle_trigger = false

var well_cabin_unlocked = false
var boss_battle_trigger = false
var ending_trigger = false
var remove_god_proximity = false

### CHECKPOINTS
var god_position_y = 20000
var checkpoint_one_trigger = false
var checkpoint_two_trigger = false
var checkpoint_three_trigger = false
var checkpoint_four_trigger = false
var checkpoint_five_trigger = false

### ITEMS 
var has_oar = false
var oar_used = false
var has_cem_key = false
var cem_key_used = false
var has_altar_key = false
var altar_key_used = false
var has_rope = false
var rope_used = false
var has_trapdoor_key = false
var trapdoor_key_used = false
var has_lighthouse_key = false
var lighthouse_key_used = false
var has_well_cabin_key = false
var well_cabin_key_used = false
var has_unknown_key = false
var unknown_key_used = false

func reset():
	spawn_position = Vector2(0, 0)
	objective = "go to the other town"
	removed_text_nodes = {}
	
	awaken = false
	god_awaken = false
	church_open = false
	well_open = false
	cave_3_left_enter = true
	trigger_awaken = false
	triggered = false
	inside_shrine = false
	riddle_trigger = false
	
	well_cabin_unlocked = false
	boss_battle_trigger = false
	ending_trigger = false
	remove_god_proximity = false

	god_position_y = 20000
	checkpoint_one_trigger = false
	checkpoint_two_trigger = false
	checkpoint_three_trigger = false
	checkpoint_four_trigger = false
	checkpoint_five_trigger = false

	has_oar = false
	oar_used = false
	has_cem_key = false
	cem_key_used = false
	has_altar_key = false
	altar_key_used = false
	has_rope = false
	rope_used = false
	has_trapdoor_key = false
	trapdoor_key_used = false
	has_lighthouse_key = false
	lighthouse_key_used = false
	has_well_cabin_key = false
	well_cabin_key_used = false
	has_unknown_key = false
	unknown_key_used = false

func get_time():
	var time_dict = Time.get_time_dict_from_system()
	return time_dict.hour
	


func checkpoint_one():
	spawn_position = Vector2(0, 0)
	objective = "find Mr. Guinto, the village official head"
	removed_text_nodes = {
		&"cm_text_01": true,
		&"cm_text_03": true,
		&"cm_text_04": true,
		&"cm_text_05": true,
		&"vlg_text_01": true,
		&"vlg_text_02": true,
		&"vlg_text_03": true,
		&"self_text_01": true,
		&"self_text_10": true,
		&"self_text_11": true,
		&"self_text_08": true,
		&"vlg_text_04": true,
	}
	
	awaken = false
	god_awaken = false
	church_open = false
	well_open = false
	cave_3_left_enter = true
	trigger_awaken = false
	triggered = false
	inside_shrine = false
	riddle_trigger = false
	
	well_cabin_unlocked = false
	boss_battle_trigger = false
	ending_trigger = false
	remove_god_proximity = false

	god_position_y = 20000
	checkpoint_one_trigger = true
	checkpoint_two_trigger = false
	checkpoint_three_trigger = false
	checkpoint_four_trigger = false
	checkpoint_five_trigger = false

	has_oar = false
	oar_used = true
	has_cem_key = false
	cem_key_used = false
	has_altar_key = false
	altar_key_used = false
	has_rope = false
	rope_used = false
	has_trapdoor_key = false
	trapdoor_key_used = false
	has_lighthouse_key = false
	lighthouse_key_used = false
	has_well_cabin_key = false
	well_cabin_key_used = false
	has_unknown_key = false
	unknown_key_used = false

func checkpoint_two():
	spawn_position = Vector2(0, 0)
	objective = "find the key to the cemetery"
	removed_text_nodes = {
		&"cm_text_01": true,
		&"cm_text_03": true,
		&"cm_text_04": true,
		&"cm_text_05": true,
		&"cm_text_06": true,
		&"cm_text_07": true,
		&"vlg_text_01": true,
		&"vlg_text_02": true,
		&"vlg_text_03": true,
		&"self_text_01": true,
		&"self_text_05": true,
		&"self_text_10": true,
		&"self_text_11": true,
		&"self_text_08": true,
		&"vlg_text_04": true,
	}
	
	awaken = true
	god_awaken = true
	church_open = true
	well_open = false
	cave_3_left_enter = true
	trigger_awaken = true
	triggered = true
	inside_shrine = false
	riddle_trigger = false
	
	well_cabin_unlocked = false
	boss_battle_trigger = false
	ending_trigger = false
	remove_god_proximity = false

	god_position_y = 20000
	checkpoint_one_trigger = true
	checkpoint_two_trigger = true
	checkpoint_three_trigger = false
	checkpoint_four_trigger = false
	checkpoint_five_trigger = false

	has_oar = false
	oar_used = true
	has_cem_key = false
	cem_key_used = false
	has_altar_key = false
	altar_key_used = true
	has_rope = false
	rope_used = false
	has_trapdoor_key = false
	trapdoor_key_used = false
	has_lighthouse_key = false
	lighthouse_key_used = false
	has_well_cabin_key = false
	well_cabin_key_used = false
	has_unknown_key = false
	unknown_key_used = false

func checkpoint_three():
	objective = "find the trashed church bell trapdoor key"
	spawn_position = Vector2(751, 46)
	
	removed_text_nodes = {
		&"cm_text_01": true,
		&"cm_text_03": true,
		&"cm_text_04": true,
		&"cm_text_05": true,
		&"cm_text_06": true,
		&"cm_text_07": true,
		&"vlg_text_01": true,
		&"vlg_text_02": true,
		&"vlg_text_03": true,
		&"self_text_01": true,
		&"self_text_05": true,
		&"self_text_10": true,
		&"self_text_11": true,
		&"self_text_12": true,
		&"self_text_09": true,
		&"self_text_08": true,
		&"self_text_07": true,
		&"vlg_text_04": true,
	}
	
	awaken = true
	god_awaken = true
	church_open = true
	well_open = false
	cave_3_left_enter = true
	trigger_awaken = true
	triggered = true
	inside_shrine = false
	riddle_trigger = false
	
	well_cabin_unlocked = false
	boss_battle_trigger = false
	ending_trigger = false
	remove_god_proximity = false

	god_position_y = 20000
	checkpoint_one_trigger = true
	checkpoint_two_trigger = true
	checkpoint_three_trigger = true
	checkpoint_four_trigger = false
	checkpoint_five_trigger = false

	has_oar = false
	oar_used = true
	has_cem_key = false
	cem_key_used = true
	has_altar_key = false
	altar_key_used = true
	has_rope = false
	rope_used = true
	has_trapdoor_key = false
	trapdoor_key_used = false
	has_lighthouse_key = false
	lighthouse_key_used = false
	has_well_cabin_key = false
	well_cabin_key_used = false
	has_unknown_key = false
	unknown_key_used = false

func checkpoint_four():
	objective = "seek answers beneath the well"
	spawn_position = Vector2(0, 0)
	
	removed_text_nodes = {
		&"cm_text_01": true,
		&"cm_text_03": true,
		&"cm_text_04": true,
		&"cm_text_05": true,
		&"cm_text_06": true,
		&"cm_text_07": true,
		&"vlg_text_01": true,
		&"vlg_text_02": true,
		&"vlg_text_03": true,
		&"self_text_01": true,
		&"self_text_05": true,
		&"self_text_10": true,
		&"self_text_11": true,
		&"self_text_12": true,
		&"self_text_09": true,
		&"self_text_08": true,
		&"self_text_07": true,
		&"vlg_text_04": true,
	}
	
	awaken = true
	god_awaken = true
	church_open = true
	well_open = true
	cave_3_left_enter = true
	trigger_awaken = true
	triggered = true
	inside_shrine = false
	riddle_trigger = false
	
	well_cabin_unlocked = false
	boss_battle_trigger = false
	ending_trigger = false
	remove_god_proximity = false

	god_position_y = 20000
	checkpoint_one_trigger = true
	checkpoint_two_trigger = true
	checkpoint_three_trigger = true
	checkpoint_four_trigger = true
	checkpoint_five_trigger = false

	has_oar = false
	oar_used = true
	has_cem_key = false
	cem_key_used = true
	has_altar_key = false
	altar_key_used = true
	has_rope = false
	rope_used = true
	has_trapdoor_key = false
	trapdoor_key_used = true
	has_lighthouse_key = false
	lighthouse_key_used = true
	has_well_cabin_key = false
	well_cabin_key_used = false
	has_unknown_key = false
	unknown_key_used = false

func checkpoint_five():
	objective = "escape"
	spawn_position = Vector2(0, 0)
	
	removed_text_nodes = {
		&"cm_text_01": true,
		&"cm_text_03": true,
		&"cm_text_04": true,
		&"cm_text_05": true,
		&"cm_text_06": true,
		&"cm_text_07": true,
		&"vlg_text_01": true,
		&"vlg_text_02": true,
		&"vlg_text_03": true,
		&"self_text_01": true,
		&"self_text_05": true,
		&"self_text_10": true,
		&"self_text_11": true,
		&"self_text_12": true,
		&"self_text_09": true,
		&"self_text_08": true,
		&"self_text_07": true,
		&"vlg_text_04": true,
	}
	
	awaken = true
	god_awaken = true
	church_open = true
	well_open = true
	cave_3_left_enter = true
	trigger_awaken = true
	triggered = true
	inside_shrine = false
	riddle_trigger = true
	
	well_cabin_unlocked = true
	boss_battle_trigger = true
	ending_trigger = false
	remove_god_proximity = true

	god_position_y = 20000
	checkpoint_one_trigger = true
	checkpoint_two_trigger = true
	checkpoint_three_trigger = true
	checkpoint_four_trigger = true
	checkpoint_five_trigger = true

	has_oar = false
	oar_used = true
	has_cem_key = false
	cem_key_used = true
	has_altar_key = false
	altar_key_used = true
	has_rope = false
	rope_used = true
	has_trapdoor_key = false
	trapdoor_key_used = true
	has_lighthouse_key = false
	lighthouse_key_used = true
	has_well_cabin_key = false
	well_cabin_key_used = true
	has_unknown_key = false
	unknown_key_used = false

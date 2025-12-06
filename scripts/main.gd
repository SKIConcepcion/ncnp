extends Node2D

@onready var forest_bg_sfx: AudioStreamPlayer = $sounds/ForestBgSfx
@onready var village_sfx: AudioStreamPlayer2D = $sounds/villageSfx
@onready var church_bell_sfx: AudioStreamPlayer2D = $sounds/ChurchBellSfx
@onready var wind_sfx: AudioStreamPlayer = $sounds/WindSfx

var bell_played := false
var wind_played := false

func _process(_delta: float) -> void:
	if Global.awaken:
		if forest_bg_sfx.playing:
			forest_bg_sfx.stop()
		if village_sfx.playing:
			village_sfx.stop()

		if not wind_played:
			wind_sfx.play()
			wind_played = true 
	else:
		wind_played = false  

	if Global.church_open:
		if not bell_played:
			church_bell_sfx.play()
			bell_played = true
	else:
		bell_played = false

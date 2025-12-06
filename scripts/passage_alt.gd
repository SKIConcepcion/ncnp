extends Node2D

@onready var church_bell_sfx: AudioStreamPlayer2D = $sounds/ChurchBellSfx
var played = false

func _process(_delta: float) -> void:
	if Global.church_open and not played:
		await get_tree().create_timer(2.0).timeout
		church_bell_sfx.play()
		await get_tree().create_timer(2.0).timeout
		played = true
		
	elif not Global.church_open:
		played = false

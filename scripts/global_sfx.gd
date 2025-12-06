extends Node

@onready var door_sfx: AudioStreamPlayer = $DoorSfx
@onready var flashlight_sfx: AudioStreamPlayer = $FlashlightSfx
@onready var pickup_sfx: AudioStreamPlayer = $PickupSfx
@onready var paper_sfx: AudioStreamPlayer = $PaperSfx
@onready var prayer_sfx: AudioStreamPlayer = $PrayerSfx
@onready var jazz_music: AudioStreamPlayer = $JazzMusic
@onready var pencil_sfx: AudioStreamPlayer = $PencilSfx
@onready var gate_sfx: AudioStreamPlayer = $GateSfx
@onready var god_sfx_01: AudioStreamPlayer = $GodSfx01
@onready var god_sfx_02: AudioStreamPlayer = $GodSfx02

var jazz_playing = false

func play_door_sfx():
	door_sfx.play()

func play_gate_sfx():
	gate_sfx.play()

func play_flashlight_sfx():
	flashlight_sfx.play()

func play_pickup_sfx():
	pickup_sfx.play()

func play_paper_sfx():
	paper_sfx.play()

func play_prayer_sfx():
	prayer_sfx.play()

func play_pencil_sfx():
	pencil_sfx.play()

func play_god_sfx():
	god_sfx_01.play()
	god_sfx_02.play()

func stop_god_sfx():
	god_sfx_01.stop()
	god_sfx_02.stop()

func play_jazz_music():
	var tween = get_tree().create_tween()
	jazz_music.volume_db = -30  
	jazz_music.pitch_scale = 1.0
	jazz_music.play()
	tween.tween_property(jazz_music, "volume_db", -5.0, 3.0)


func stop_jazz_music_sudden():
	jazz_music.stop()


func stop_jazz_music():
	if not jazz_music.is_playing():
		return
	
	var tween = get_tree().create_tween()
	
	tween.tween_property(jazz_music, "pitch_scale", 0.6, 5.0).set_delay(1.0)  
	tween.tween_property(jazz_music, "volume_db", -30, 3.0)

	tween.finished.connect(func ():
		jazz_music.stop()
		jazz_music.volume_db = 0
		jazz_music.pitch_scale = 1.0 
	)

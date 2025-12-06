extends CharacterBody2D


const SPEED = 90
const JUMP_VELOCITY = -270.0

const SPRINT_SPEED = 115
const SPRINT_DURATION = 2.0
const SPRINT_COOLDOWN = 16.0

var is_sprinting = false
var sprint_timer = 0.0
var sprint_cooldown_timer = 0.0

@onready var sprint_timer_label: Label = $CanvasLayer/Label
@onready var sprint: TouchScreenButton = $CanvasLayer/Sprint

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var light: PointLight2D = $FlashlightRay
@onready var flashlight: Sprite2D = $Flashlight
@onready var warning_countdown: Label = $CanvasLayer/warning/warning_countdown
@onready var walking_sfx: AudioStreamPlayer = $WalkingSfx
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var pause_menu: Control = $CanvasLayer/pause_menu



func _ready() -> void:
	
	add_to_group("player")
	
	global_position = Global.spawn_position

	var current_scene_name = get_tree().current_scene.name
	
	var flashlight_scenes = ["Cabin01", "PassageCave", "Cave01", "Cave02", "Cave03", "Cabin02", "Church02", "Church03", "Church05", "Lighthouse01", "Lighthouse01Alt", "MazeCave01", "MazeCave01Alt", "MazeCave02", "WellCave01", "WellCave02", "WellCave03", "WellCabin01", "WellCave04", "WellCave05", "WellCave06", "WellCave08", "UnknownCave" ]
	var flashlight_enabled = current_scene_name in flashlight_scenes

	
	if light:
		light.visible = flashlight_enabled
	
	if flashlight:
		flashlight.visible = flashlight_enabled
		
		
		
	if Global.awaken == true and current_scene_name != "Afterlife" and !Global.remove_god_proximity:
		var threats = get_tree().get_nodes_in_group("god")
		if threats.size() > 0:
			var _god = threats[0]  
	else:
		$CanvasLayer/warning.visible = false
		


func _physics_process(delta: float) -> void:
	
	if sprint_cooldown_timer > 0:
		sprint_timer_label.text = str(int(ceil(sprint_cooldown_timer)))
	else:
		sprint_timer_label.text = ""
		
	if is_sprinting or sprint_cooldown_timer > 0:
		sprint.modulate.a = 0.2  
	else:
		sprint.modulate.a = 0.588 

	
	# Update timers
	if is_sprinting:
		sprint_timer -= delta
		if sprint_timer <= 0:
			is_sprinting = false

	if sprint_cooldown_timer > 0:
		sprint_cooldown_timer -= delta

	# Trigger sprint
	if Input.is_action_just_pressed("sprint") and !is_sprinting and sprint_cooldown_timer <= 0:
		is_sprinting = true
		sprint_timer = SPRINT_DURATION
		sprint_cooldown_timer = SPRINT_COOLDOWN

	
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		GlobalSfx.play_paper_sfx()
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()
	
	$Oar.visible = Global.has_oar
	$CemKey.visible = Global.has_cem_key
	$AltarKey.visible = Global.has_altar_key
	$Rope.visible = Global.has_rope
	$TrapdoorKey.visible = Global.has_trapdoor_key
	$LighthouseKey.visible = Global.has_lighthouse_key
	$WellCabinKey.visible = Global.has_well_cabin_key
	$UnknownKey.visible = Global.has_unknown_key

	$CanvasLayer/objective_title/objective.text = Global.objective
	
	if Input.is_action_just_pressed("flashlight"):
		GlobalSfx.play_flashlight_sfx()
		light.visible = !light.visible
		flashlight.visible = !flashlight.visible
		
	#light.scale.x = -1 if animated_sprite.flip_h else 1
	
	
	
	
	if Input.is_action_just_pressed("drop"):
		position.y += 2
		
	
	
	
	var current_scene_name = get_tree().current_scene.name
	
	if Global.awaken == true and current_scene_name != "Afterlife" and !Global.remove_god_proximity:
		$CanvasLayer/warning.visible = true
		var threats = get_tree().get_nodes_in_group("god")
		if threats.size() > 0:
			var god = threats[0]  
			var distance = global_position.distance_to(god.global_position)

			# Update warning label
			warning_countdown.text = str("%.0f" % (distance * 0.01)) + "m"

			# Calculate `i` based on inverse of distance
			var max_distance = 800.0  # Adjust this to fit your max detection range
			var min_i = 0.01
			var max_i = 0.80
			
			var normalized = clamp(1.0 - (distance / max_distance), 0.0, 1.0)
			var i = lerp(min_i, max_i, normalized)

			color_rect.color.a = i
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
		flashlight.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		flashlight.flip_h = true
		
	if direction == 0 or !is_on_floor():
		animated_sprite.play("idle")
		walking_sfx.stop()
	else:
		if is_sprinting:
			animated_sprite.play("sprint")
		else:
			animated_sprite.play("run")
		
		if not walking_sfx.playing and is_on_floor() and !get_tree().paused:
			walking_sfx.play()


	
	if direction:
		var current_speed = SPRINT_SPEED if is_sprinting else SPEED
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		
	move_and_slide()



func resume():
	if pause_menu:
		pause_menu.visible = false
	get_tree().paused = false
	GlobalSfx.play_flashlight_sfx()
	

func pause():
	if pause_menu:
		pause_menu.visible = true
	get_tree().paused = true


func _on_resume_pressed() -> void:
	resume() 

func _on_exit_pressed() -> void:
	resume() 
	ScreenTrans.change_scene("res://scenes/screens/main_menu.tscn")

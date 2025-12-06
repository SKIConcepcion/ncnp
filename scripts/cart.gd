extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var push = false
var direction = 0
var previous_x_position: float

func _ready() -> void:
	previous_x_position = global_position.x

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if push:
		velocity.x = direction * delta
	else:
		velocity.x = 0

	move_and_slide()

	if is_equal_approx(global_position.x, previous_x_position):
		if audio_stream_player_2d.playing:
			audio_stream_player_2d.stop()
		if animated_sprite.is_playing():
			animated_sprite.stop()
	else:
		if push:
			if not audio_stream_player_2d.playing:
				audio_stream_player_2d.play()
			if not animated_sprite.is_playing():
				animated_sprite.play()

	previous_x_position = global_position.x




func _on_left_body_entered(body):
	if body.name == "Player":
		audio_stream_player_2d.play()
		direction = 820
		push = true

func _on_left_body_exited(body):
	if body.name == "Player":
		audio_stream_player_2d.stop()
		direction = 0
		push = false

func _on_right_body_entered(body):
	if body.name == "Player":
		audio_stream_player_2d.play()
		direction = -820
		push = true

func _on_right_body_exited(body):
	if body.name == "Player":
		audio_stream_player_2d.stop()
		direction = 0
		push = false

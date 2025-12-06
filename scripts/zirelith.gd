extends CharacterBody2D

@onready var target = null
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var speed = 35

func _ready():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		target = players[0]

func _physics_process(delta: float) -> void:
	if target:
		if !Global.awaken:
			if self.name == "zirelith_right_02":
				queue_free()

		if Global.cave_3_left_enter or !Global.awaken:
			if self.name == "zirelith_right_01":
				queue_free()
				return
		
		if !Global.cave_3_left_enter or !Global.awaken:
			if self.name == "zirelith_left_01":
				queue_free()
				return
				
		if self.name == "zirelith_right_02":
			speed = 95

		var direction = (target.position - position).normalized()
		velocity.x = direction.x * speed

		if not is_on_floor():
			velocity += get_gravity() * delta

		if direction.x != 0:
			animated_sprite_2d.flip_h = direction.x < 0

		move_and_slide()

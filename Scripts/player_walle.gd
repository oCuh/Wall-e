extends CharacterBody2D

class_name player_walle

@export_group("locomotion")
@export var SPEED = 100.0
@export var jump_velocity = -350
@export_group("")

@onready var animated_sprite_2d = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = jump_velocity

	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5

	var direction = Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	else:
		animated_sprite_2d.play("normal")


func shoot():
	animated_sprite_2d.play("shooting")
	set_physics_process(false)
	

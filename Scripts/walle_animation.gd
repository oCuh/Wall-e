extends AnimatedSprite2D

class_name WalleAnimatedSprite

func _on_animation_finished():
	if animation == "shooting":
		get_parent().set_physics_process(true)

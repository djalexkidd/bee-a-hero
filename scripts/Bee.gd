extends KinematicBody2D

var movedir = Vector2(0,0)
const SPEED = 180 #Vitesse du joueur

func _physics_process(delta):
	movedir.x = -Input.get_action_strength("left") + Input.get_action_strength("right")
	movedir.y = +Input.get_action_strength("down") - Input.get_action_strength("up")
	
	movedir = movedir.clamped(1)
	
	var velocity = movedir * SPEED
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("left"):
		$Sprite.flip_h = true
	if Input.is_action_just_pressed("right"):
		$Sprite.flip_h = false

extends KinematicBody2D

var movedir = Vector2(0,0)
const SPEED = 180 #Vitesse du joueur

func _physics_process(delta):
	# Déplacement horizontal
	movedir.x = -Input.get_action_strength("left") + Input.get_action_strength("right")
	# Déplacement vertical
	movedir.y = +Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Pour éviter que la vitesse ne double lorsque deux directions sont pressées
	movedir = movedir.clamped(1)
	
	var velocity = movedir * SPEED
	
	velocity = move_and_slide(velocity)
	
	# Inverse le sprite si la touche gauche est pressée
	if Input.is_action_just_pressed("left"):
		$AnimatedSprite.flip_h = true
	# Inverse pas le sprite si la touche droite est pressée
	if Input.is_action_just_pressed("right"):
		$AnimatedSprite.flip_h = false

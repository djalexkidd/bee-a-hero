extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 100 #Vitesse du joueur
const GRAVITY = 1 # Gravity

func _physics_process(delta):
	if Input.is_action_pressed("right"): #Touche droite
		velocity.x = SPEED
	
	if Input.is_action_pressed("left"): #Touche gauche
		velocity.x = -SPEED
	
	if Input.is_action_just_pressed("down"):
		velocity.y = SPEED
	
	if Input.is_action_just_pressed("up"):
		velocity.y = -SPEED
	
	else:
		velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.07)
	
	# Inverse le sprite si la touche gauche est pressée
	if Input.is_action_just_pressed("left"):
		$AnimatedSprite.flip_h = true
	# Inverse pas le sprite si la touche droite est pressée
	if Input.is_action_just_pressed("right"):
		$AnimatedSprite.flip_h = false

func ouch():
	get_tree().change_scene("res://scenes/GameOver.tscn")

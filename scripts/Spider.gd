extends KinematicBody2D

var speed = 50 #Vitesse
var velocity = Vector2()
export var direction_x = 0 #-1 = Direction vers la gauche, 1 = Direction vers la droite
export var direction_y = -1 #-1 = Direction vers le haut, 1 = Direction vers le bas

func _ready():
	if direction_y == 1:
		$Sprite.flip_v = true
	
	if direction_x != 0:
		$Sprite.rotation_degrees = 90

func _physics_process(delta):
	velocity.x = speed * direction_x
	velocity.y = speed * direction_y
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_top_checker_body_entered(body): # Touche le haut
	if direction_y != 0:
		direction_y = direction_y * -1
		$Sprite.flip_v = not $Sprite.flip_v
	else:
		direction_x = direction_x * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$Sprite.rotation_degrees += 180

func _on_sides_checker_body_entered(body): # Touche le bas
	_on_top_checker_body_entered(body)

func _on_oof_body_entered(body):
	body.ouch(body)

extends KinematicBody2D

const speed = 700 #Vitesse
var velocity = Vector2()

func _ready():
	set_position(get_node("/root/Level1/Bee").get_position() + Vector2(50, 5))
	$GunSound.play()

func _physics_process(delta):
	velocity.x = speed #La balle se déplace vers le haut
	velocity = move_and_slide(velocity)

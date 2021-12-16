extends Node2D

var bullet_ressource = preload("res://scenes/Bullet.tscn")
var dezoom

func _physics_process(delta):
	if Input.is_action_just_pressed("fire") and Global.kitchen_gun: #Quand le clic gauche est appuyé
		var bullet = bullet_ressource.instance() #Instance en tant que noeud
		add_child(bullet) #L'ajoute dans la scène

func _on_ChangeCamera_body_entered(body):
	if !dezoom:
		dezoom = true
		$Bee/Camera2D.limit_top = -1000000
		$AnimationPlayer.play("zoom")
	else:
		dezoom = false
		$Bee/Camera2D.limit_top = -420
		$AnimationPlayer.play("dezoom")

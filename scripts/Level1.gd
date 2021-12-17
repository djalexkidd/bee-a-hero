extends Node2D

var dezoom

func _on_ChangeCamera_body_entered(body):
	if !dezoom:
		dezoom = true
		$Bee/Camera2D.limit_top = -1000000
		$AnimationPlayer.play("zoom")
	else:
		dezoom = false
		$Bee/Camera2D.limit_top = -420
		$AnimationPlayer.play("dezoom")

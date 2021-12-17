extends Node2D

func _on_FinishLevel_body_entered(body):
	get_tree().change_scene("res://scenes/LevelFinished.tscn")

extends Control

func _on_RetryButton_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")

func _on_QuitButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

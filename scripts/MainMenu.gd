extends Control

# Bouton pour jouer au jeu
func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")

# Ouvre le menu des paramètres
func _on_OptionsButton_pressed():
	$OptionsMenu/AnimationPlayer.play("Slide")
	$Overlay.show()

# Ferme le menu des paramètres
func _on_CloseMenuButton_pressed():
	$OptionsMenu/AnimationPlayer.play("Unslide")

# Bouton pour quitter le jeu
func _on_QuitButton_pressed():
	get_tree().quit()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Unslide":
		$Overlay.hide()

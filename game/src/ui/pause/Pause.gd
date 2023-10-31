extends Control

onready var buttons:VBoxContainer = $Buttons

func _on_PauseButton_pressed():
	Global.click()
	buttons.show()
	get_tree().paused = true
	
func _on_Menu_pressed():
	if Global.music:
		Global.music_loop.fade_in()
	Global.click()
	if Global.current_league_game != null:
		Global.game_over(0,5)
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Resume_pressed():
	Global.click()
	buttons.hide()
	get_tree().paused = false

extends Node2D

func _on_Menu_pressed():
	Global.click()
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Replay_pressed():
	Global.click()
	if Global.music:
		Global.music_loop.fade_out()
	get_tree().paused = false
	if get_parent().get_name() == "SinglePlayer":
		get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
	else:
		get_tree().change_scene("res://src/ui/game/multiplayer/Multiplayer.tscn")

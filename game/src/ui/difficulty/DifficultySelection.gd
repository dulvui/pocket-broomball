extends Control

var animation_player

func _ready():
	Global.set_home_team(null)
	Global.set_away_team(null)
	Global.current_league_game = null
	Global.home_team_power = 10
	Global.home_team_speed = 10
	
	animation_player = $AnimationPlayer
	
	animation_player.play("FadeIn")

func _on_Easy_pressed():
	Global.click()
	Global.away_team_power = 2.5
	Global.away_team_speed = 2.5
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Medium_pressed():
	Global.click()
	Global.away_team_power = 4
	Global.away_team_speed = 4
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Hard_pressed():
	Global.click()
	Global.away_team_power = 6
	Global.away_team_speed = 6
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
	


func _on_Extreme_pressed():
	Global.click()
	Global.away_team_power = 8
	Global.away_team_speed = 8
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Legend_pressed():
	Global.click()
	Global.away_team_power = 10
	Global.away_team_speed = 10
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_GoBack_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")

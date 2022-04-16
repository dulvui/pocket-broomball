extends Control


var animation_player

func _ready():
	animation_player = $AnimationPlayer
	animation_player.play("FadeIn")

func _on_League_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	if Global.league_started:
		get_tree().change_scene("res://src/ui/championship/dashboard/Dashboard.tscn")
	else:
		get_tree().change_scene("res://src/ui/championship/Championship.tscn")


func _on_Arcade_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/game/arcade/ArcadeDashboard.tscn")


func _on_Single_Match_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/difficulty/DifficultySelection.tscn")


func _on_OneVsOne_pressed():
	Global.click()
	Global.set_home_team(null)
	Global.set_away_team(null)
	Global.home_team_power = 10
	Global.home_team_speed = 10
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/game/multiplayer/Multiplayer.tscn")


func _on_Back_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

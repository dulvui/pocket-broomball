extends Control

var animation_player

var home_icon
var home_name

var away_icon
var away_name

func _ready():
	animation_player = $AnimationPlayer
	
	home_icon = $Control/Home/HomeIcon
	home_name = $Control/Home/HomeName
	
	away_icon = $Control/Away/AwayIcon
	away_name = $Control/Away/AwayName
	
	home_icon.texture = Global.home_team_icon
	home_name.text = Global.home_team_name
	
	away_icon.texture = Global.away_team_icon
	away_name.text = Global.away_team_name
	
	animation_player.play("Show")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")

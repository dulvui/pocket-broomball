extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$HomeIcon.set_texture(Global.home_team_icon)
	$AwayIcon.set_texture(Global.away_team_icon)


func goal_sound():
	if Global.sfx:
		$Sounds/GoalCheer.play()
		$Sounds/GoalSound.play()

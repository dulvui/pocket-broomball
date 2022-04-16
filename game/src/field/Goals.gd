extends Node2D

signal home_goal
signal away_goal

var goal = false

var timer

func _ready():
	timer = $Timer
	


func reset():
	goal = false

func _on_AwayBallDetector_body_entered(body):
	if not goal:
		goal = true
		timer.start()
		emit_signal("home_goal")


func _on_HomeBallDetector_body_entered(body):
	if not goal:
		goal = true
		timer.start()
		emit_signal("away_goal")



func _on_Timer_timeout():
	goal = false

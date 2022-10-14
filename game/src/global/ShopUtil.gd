extends Node

const BALLS = ["orange.png", "red.png", "blue.png"]

var ball = "orange.png"

func select_ball(index):
	ball = BALLS[index]
	
func get_ball_texture(index=null):
	if index != null:
		return load("res://assets/balls/" + BALLS[index])
	return load("res://assets/balls/" + ball)

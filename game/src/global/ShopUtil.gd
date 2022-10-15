extends Node

var balls
var unlocked_balls_ids
var selected_ball_id


func load_assets():
	_load_balls()

func _load_balls():
		balls = [
		 {
			"id" : 0,
			"price" : 0,
			"texture": load("res://assets/balls/orange.png")
		},
		{
			"id" : 1,
			"price" : 10,
			"texture": load("res://assets/balls/blue.png")
		},
		{
			"id" : 2,
			"price" : 10,
			"texture": load("res://assets/balls/red.png")
		}
	]

func select_ball(id):
	if id in unlocked_balls_ids:
		selected_ball_id = id
	elif Global.use_coins(balls[id]["price"]):
		unlocked_balls_ids.append(id)
		selected_ball_id = id
	
func get_ball_texture(index=null):
	if index != null:
		return balls[index]["texture"]
	return balls[selected_ball_id]["texture"]

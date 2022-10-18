extends Node

enum TYPES {BALL, STICK, HELMET, GLOVES, FIELD}
var items = {}


func _ready():
	for type in TYPES:
		items[type] = {}

func load_assets():
	_load_balls()

func _load_balls():
		items["BALL"] = {
			"selected_ball" : 0,
			"unlocked" : [0],
			"list": [
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
	}

func select(type,id):
	if id in items[type]["unlocked"]:
		items["selected"] = id
	elif Global.use_coins(items[type][id]["price"]):
		items[type]["unlocked"].append(id)
		items[type]["selected"] = id
	
func get_texture(type,index=null):
	if index != null:
		return items[type]["list"][index]["texture"]
	return items[type][items[type]["selected"]]["texture"]
	
func get_ball_texture(index=null):
	if index != null:
		return items["BALL"][index]["texture"]
	return items["BALL"]["list"][items["BALL"]["selected"]]["texture"]

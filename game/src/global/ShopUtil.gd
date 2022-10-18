extends Node

enum TYPES {BALL, STICK, HELMET}
var items = {}


func _ready():
	for type in TYPES:
		items[type] = {}

func load_assets():
	_load_balls()
	_load_sticks()
	_load_helmets()	

func _load_balls():
		items["BALL"] = {
			"selected" : 0,
			"unlocked" : [0],
			"list": [
				 {
					"id" : 0,
					"price" : 0,
					"texture": load("res://assets/shop/ball/orange.png")
				},
				{
					"id" : 1,
					"price" : 10,
					"texture": load("res://assets/shop/ball/blue.png")
				},
				{
					"id" : 2,
					"price" : 10,
					"texture": load("res://assets/shop/ball/red.png")
				}
			]
		}

func _load_sticks():
		items["STICK"] = {
			"selected" : 0,
			"unlocked" : [0],
			"list": [
				 {
					"id" : 0,
					"price" : 0,
					"texture": load("res://assets/shop/stick/red.png")
				},
				{
					"id" : 1,
					"price" : 10,
					"texture": load("res://assets/shop/stick/blue.png")
				},
				{
					"id" : 2,
					"price" : 10,
					"texture": load("res://assets/shop/stick/green.png")
				}
			]
		}
		
func _load_helmets():
		items["HELMET"] = {
			"selected" : 0,
			"unlocked" : [0],
			"list": [
				 {
					"id" : 0,
					"price" : 0,
					"texture": load("res://assets/shop/helmet/black.png")
				},
				{
					"id" : 1,
					"price" : 10,
					"texture": load("res://assets/shop/helmet/pink.png")
				},
				{
					"id" : 2,
					"price" : 10,
					"texture": load("res://assets/shop/helmet/blue.png")
				}
			]
		}


func select(type,id):
	if id in items[type]["unlocked"]:
		items["selected"] = id
	elif Global.use_coins(items[type]["list"][id]["price"]):
		items[type]["unlocked"].append(id)
		items[type]["selected"] = id
	
func get_texture(type,index=null):
	if index != null:
		return items[type]["list"][index]["texture"]
	return items[type]["list"][items[type]["selected"]]["texture"]
	
func get_ball_texture(index=null):
	if index != null:
		return items["BALL"]["list"][index]["texture"]
	return items["BALL"]["list"][items["BALL"]["selected"]]["texture"]

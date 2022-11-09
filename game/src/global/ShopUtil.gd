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
					"price" : 10000,
					"texture": load("res://assets/shop/ball/blue.png")
				},
				{
					"id" : 2,
					"price" : 10000,
					"texture": load("res://assets/shop/ball/red.png")
				},
				{
					"id" : 3,
					"price" : 50000,
					"texture": load("res://assets/shop/ball/white.png")
				},
				{
					"id" : 4,
					"price" : 50000,
					"texture": load("res://assets/shop/ball/yellow.png")
				},
				{
					"id" : 5,
					"price" : 50000,
					"texture": load("res://assets/shop/ball/pink.png")
				},
				{
					"id" : 6,
					"price" : 50000,
					"texture": load("res://assets/shop/ball/orange.png")
				},
				{
					"id" : 7,
					"price" : 50000,
					"texture": load("res://assets/shop/ball/green.png")
				},
				{
					"id" : 8,
					"price" : 100000,
					"texture": load("res://assets/shop/ball/brown.png")
				},
				{
					"id" : 9,
					"price" : 100000,
					"texture": load("res://assets/shop/ball/azure.png")
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
					"price" : 10000,
					"texture": load("res://assets/shop/stick/blue.png")
				},
				{
					"id" : 2,
					"price" : 10000,
					"texture": load("res://assets/shop/stick/green.png")
				},
				{
					"id" : 3,
					"price" : 50000,
					"texture": load("res://assets/shop/stick/black.png")
				},
				{
					"id" : 4,
					"price" : 50000,
					"texture": load("res://assets/shop/stick/beige.png")
				},
				{
					"id" : 5,
					"price" : 50000,
					"texture": load("res://assets/shop/stick/brown.png")
				},
				{
					"id" : 6,
					"price" : 50000,
					"texture": load("res://assets/shop/stick/lime.png")
				},
				{
					"id" : 7,
					"price" : 50000,
					"texture": load("res://assets/shop/stick/wine.png")
				},
				{
					"id" : 8,
					"price" : 100000,
					"texture": load("res://assets/shop/stick/yellow.png")
				},
				{
					"id" : 9,
					"price" : 100000,
					"texture": load("res://assets/shop/stick/azure.png")
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
					"price" : 10000,
					"texture": load("res://assets/shop/helmet/pink.png")
				},
				{
					"id" : 2,
					"price" : 10000,
					"texture": load("res://assets/shop/helmet/blue.png")
				},
				{
					"id" : 3,
					"price" : 50000,
					"texture": load("res://assets/shop/helmet/beige.png")
				},
				{
					"id" : 4,
					"price" : 50000,
					"texture": load("res://assets/shop/helmet/green.png")
				},
				{
					"id" : 5,
					"price" : 50000,
					"texture": load("res://assets/shop/helmet/red.png")
				},
				{
					"id" : 6,
					"price" : 50000,
					"texture": load("res://assets/shop/helmet/white.png")
				},
				{
					"id" : 7,
					"price" : 50000,
					"texture": load("res://assets/shop/helmet/yellow.png")
				},
				{
					"id" : 8,
					"price" : 100000,
					"texture": load("res://assets/shop/helmet/red.png")
				},
				{
					"id" : 9,
					"price" : 100000,
					"texture": load("res://assets/shop/helmet/turquoise.png")
				}
			]
		}


func select(type,id):
	if id in items[type]["unlocked"]:
		items[type]["selected"] = id
		return true
	elif Global.use_coins(items[type]["list"][id]["price"]):
		items[type]["unlocked"].append(id)
		items[type]["selected"] = id
		return true
	return false
	
func get_texture(type,index=null):
	if index != null:
		return items[type]["list"][index]["texture"]
	return items[type]["list"][items[type]["selected"]]["texture"]
	
func get_random_texture(type):
	return items[type]["list"][randi() % items[type]["list"].size()]["texture"]
	
func get_ball_texture(index=null):
	if index != null:
		return items["BALL"]["list"][index]["texture"]
	return items["BALL"]["list"][items["BALL"]["selected"]]["texture"]

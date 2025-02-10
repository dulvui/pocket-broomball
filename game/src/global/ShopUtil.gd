# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node

enum TYPES { BALL, STICK, HELMET }
var items: Dictionary = {}


func _ready() -> void:
	for type in TYPES:
		items[type] = {}


func load_assets() -> void:
	_load_balls()
	_load_sticks()
	_load_helmets()


func _load_balls() -> void:
	items["BALL"] = {
		"selected": 0,
		"unlocked": [0],
		"list":
		[
			{"id": 0, "price": 0, "texture": load("res://assets/shop/ball/orange.png")},
			{"id": 1, "price": 10000, "texture": load("res://assets/shop/ball/blue.png")},
			{"id": 2, "price": 10000, "texture": load("res://assets/shop/ball/red.png")},
			{"id": 3, "price": 50000, "texture": load("res://assets/shop/ball/white.png")},
			{"id": 4, "price": 50000, "texture": load("res://assets/shop/ball/yellow.png")},
			{"id": 5, "price": 50000, "texture": load("res://assets/shop/ball/pink.png")},
			{"id": 6, "price": 50000, "texture": load("res://assets/shop/ball/black.png")},
			{"id": 7, "price": 50000, "texture": load("res://assets/shop/ball/green.png")},
			{"id": 8, "price": 100000, "texture": load("res://assets/shop/ball/brown.png")},
			{"id": 9, "price": 100000, "texture": load("res://assets/shop/ball/azure.png")},
			{"id": 10, "price": 200000, "texture": load("res://assets/shop/ball/white-red.png")},
			{"id": 11, "price": 200000, "texture": load("res://assets/shop/ball/blue-white.png")},
			{"id": 12, "price": 200000, "texture": load("res://assets/shop/ball/yellow-green.png")},
			{"id": 13, "price": 200000, "texture": load("res://assets/shop/ball/pink-azure.png")},
			{
				"id": 14,
				"price": 300000,
				"texture": load("res://assets/shop/ball/red-white-stripes.png")
			},
			{
				"id": 15,
				"price": 300000,
				"texture": load("res://assets/shop/ball/blue-white-stripes.png")
			},
			{
				"id": 16,
				"price": 300000,
				"texture": load("res://assets/shop/ball/green-white-stripes.png")
			},
			{
				"id": 17,
				"price": 300000,
				"texture": load("res://assets/shop/ball/white-black-stripes.png")
			},
			{
				"id": 18,
				"price": 300000,
				"texture": load("res://assets/shop/ball/yellow-black-stripes.png")
			},
			{
				"id": 19,
				"price": 300000,
				"texture": load("res://assets/shop/ball/yellow-green-stripes.png")
			},
			{
				"id": 20,
				"price": 300000,
				"texture": load("res://assets/shop/ball/yellow-white-stripes.png")
			}
		]
	}


func _load_sticks():
	items["STICK"] = {
		"selected": 0,
		"unlocked": [0],
		"list":
		[
			{"id": 0, "price": 0, "texture": load("res://assets/shop/stick/red.png")},
			{"id": 1, "price": 10000, "texture": load("res://assets/shop/stick/blue.png")},
			{"id": 2, "price": 10000, "texture": load("res://assets/shop/stick/green.png")},
			{"id": 3, "price": 50000, "texture": load("res://assets/shop/stick/black.png")},
			{"id": 4, "price": 50000, "texture": load("res://assets/shop/stick/beige.png")},
			{"id": 5, "price": 50000, "texture": load("res://assets/shop/stick/brown.png")},
			{"id": 6, "price": 50000, "texture": load("res://assets/shop/stick/lime.png")},
			{"id": 7, "price": 50000, "texture": load("res://assets/shop/stick/wine.png")},
			{"id": 8, "price": 100000, "texture": load("res://assets/shop/stick/yellow.png")},
			{"id": 9, "price": 100000, "texture": load("res://assets/shop/stick/azure.png")}
		]
	}


func _load_helmets() -> void:
	items["HELMET"] = {
		"selected": 0,
		"unlocked": [0],
		"list":
		[
			{"id": 0, "price": 0, "texture": load("res://assets/shop/helmet/black.png")},
			{"id": 1, "price": 10000, "texture": load("res://assets/shop/helmet/pink.png")},
			{"id": 2, "price": 10000, "texture": load("res://assets/shop/helmet/blue.png")},
			{"id": 3, "price": 50000, "texture": load("res://assets/shop/helmet/beige.png")},
			{"id": 4, "price": 50000, "texture": load("res://assets/shop/helmet/green.png")},
			{"id": 5, "price": 50000, "texture": load("res://assets/shop/helmet/red.png")},
			{"id": 6, "price": 50000, "texture": load("res://assets/shop/helmet/white.png")},
			{"id": 7, "price": 50000, "texture": load("res://assets/shop/helmet/yellow.png")},
			{"id": 8, "price": 100000, "texture": load("res://assets/shop/helmet/red.png")},
			{"id": 9, "price": 100000, "texture": load("res://assets/shop/helmet/turquoise.png")}
		]
	}


func select(type: String, id: int) -> bool:
	if id in items[type]["unlocked"]:
		items[type]["selected"] = id
		return true
	elif Global.use_coins(items[type]["list"][id]["price"]):
		items[type]["unlocked"].append(id)
		items[type]["selected"] = id
		return true
	return false


func get_texture(type: String, index: int = -1) -> Texture:
	if index >= 0:
		return items[type]["list"][index]["texture"]
	return items[type]["list"][items[type]["selected"]]["texture"]


func get_random_texture(type: String) -> Texture:
	return items[type]["list"][randi() % items[type]["list"].size()]["texture"]


func get_ball_texture(index: int = -1) -> Texture:
	if index >= 0:
		return items["BALL"]["list"][index]["texture"]
	return items["BALL"]["list"][items["BALL"]["selected"]]["texture"]

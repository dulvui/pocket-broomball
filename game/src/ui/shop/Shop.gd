# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

enum TYPES {BALL, STICK, HELMET}
var current_type:String = "BALL"
var current_index:Dictionary = {
	"BALL": 0,
	"STICK": 0,
	"HELMET": 0,
}

onready var type_label:Label = $Content/Type/Label
onready var price_label:Label = $Content/ItemButtons/Price
onready var buy_button:Button = $Content/VBoxContainer/Buy
onready var current_item:Sprite = $Objects/CurrentItem
onready var ball:Sprite = $Objects/Ball
onready var animated_body:Node2D = $Objects/AnimatedBody
onready var locker:AnimatedSprite = $Objects/Locker

func _ready() -> void:
	current_index["BALL"] = ShopUtil.items["BALL"]["selected"]
	current_item.texture = ShopUtil.get_ball_texture()
	ball.texture = ShopUtil.get_ball_texture()
	buy_button.text = "SELECTED"
	locker.visible = false

func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Buy_pressed() -> void:
	Global.click()
	var success:bool = ShopUtil.select(current_type, current_index[current_type])
	
	if locker.visible and success:
		locker.play("open")
		yield(locker,"animation_finished")
		locker.play("idle")
		locker.hide()
		price_label.text = ""

	_update()


func _on_PrevItem_pressed() -> void:
	Global.click()
	current_index[current_type] -= 1
	if current_index[current_type] < 0:
		current_index[current_type] = ShopUtil.items[current_type]["list"].size() - 1
	_update()
	

func _on_NextItem_pressed() -> void:
	Global.click()
	current_index[current_type] += 1
	if current_index[current_type] >= ShopUtil.items[current_type]["list"].size():
		current_index[current_type] = 0
	_update()

func _on_PrevType_pressed() -> void:
	Global.click()
	var current_type_index:int = TYPES.keys().find(current_type)
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type
	_update()
	

func _on_NextType_pressed() -> void:
	Global.click()
	var current_type_index:int = TYPES.keys().find(current_type)
	current_type_index -= 1
	if current_type_index < 0:
		current_type_index = TYPES.size() - 1
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type
	_update()

func _update() -> void:
	# update button text
	if current_index[current_type] == ShopUtil.items[current_type]["selected"]:
		buy_button.text = "SELECTED"
		locker.hide()
		price_label.text = ""
	elif current_index[current_type] in ShopUtil.items[current_type]["unlocked"]:
		buy_button.text = "SELECT"
		locker.hide()
		price_label.text = ""
	else:
		locker.show()
		price_label.show()
		price_label.text = str(ShopUtil.items[current_type]["list"][current_index[current_type]]["price"])
		buy_button.text = "BUY"
	
	# update textures
	animated_body.change_style()
	current_item.texture = ShopUtil.get_texture(current_type,current_index[current_type])
	ball.texture = ShopUtil.get_ball_texture()
	
	# scale if not ball
	if current_type == "BALL":
		current_item.scale = Vector2(4,4)
	else:
		current_item.scale = Vector2(8,8)

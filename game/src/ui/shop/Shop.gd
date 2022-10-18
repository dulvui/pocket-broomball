extends Node2D

enum TYPES {BALL, STICK, HELMET, GLOVES, FIELD}
var current_type = "BALL"
var current_item_index = 0

onready var type_label = $TypeLabel

func _ready():
	current_item_index = ShopUtil.items["BALL"]["selected"]
	$Player/Ball.texture = ShopUtil.get_ball_texture()
	if current_item_index in  ShopUtil.items["BALL"]["unlocked"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECT"
	else:
		$CenterContainer/VBoxContainer/Buy.text = "BUY"

func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Buy_pressed():
	Global.click()
	# current item price as parameter
#	Global.use_coins(current_item_index)

	ShopUtil.select(current_type, current_item_index)


func _on_PrevItem_pressed():
	Global.click()
	current_item_index -= 1
	if current_item_index < 0:
		current_item_index = ShopUtil.items[current_type]["list"].size() - 1
	if current_item_index in  ShopUtil.items[current_type]["unlocked"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECT"
	else:
		$CenterContainer/VBoxContainer/Buy.text = "BUY"
	$Player/Ball.texture = ShopUtil.get_ball_texture(current_item_index)


func _on_NextItem_pressed():
	Global.click()
	current_item_index += 1
	if current_item_index > ShopUtil.items[current_type]["list"].size() - 1:
		current_item_index = 0
	if current_item_index in  ShopUtil.items[current_type]["unlocked"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECT"
	else:
		$CenterContainer/VBoxContainer/Buy.text = "BUY"
	$Player/Ball.texture = ShopUtil.get_texture(current_type,current_item_index)


func _on_PrevType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type
	

func _on_NextType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index -= 1
	if current_type_index < 0:
		current_type_index = TYPES.size() - 1
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type

extends Node2D

enum TYPES {BALL, STICK, HELMET, GLOVES, FIELD}
var current_type = "BALL"
var current_item_index = 0
var current_type_index = 0

onready var type_label = $TypeLabel

func _ready():
	$Player/Ball.texture = ShopUtil.get_ball_texture()

func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Buy_pressed():
	Global.click()
	# current item price as parameter
#	Global.use_coins(current_item_index)

	ShopUtil.select_ball(current_item_index)


func _on_PrevItem_pressed():
	Global.click()
	current_item_index -= 1
	if current_item_index < 0:
		current_item_index = ShopUtil.balls.size() - 1
	$Player/Ball.texture = ShopUtil.get_ball_texture(current_item_index)


func _on_NextItem_pressed():
	Global.click()
	current_item_index += 1
	if current_item_index > ShopUtil.balls.size() - 1:
		current_item_index = 0
	$Player/Ball.texture = ShopUtil.get_ball_texture(current_item_index)


func _on_PrevType_pressed():
	Global.click()
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	type_label.text = TYPES.keys()[current_type_index]
	

func _on_NextType_pressed():
	Global.click()
	current_type_index -= 1
	if current_type_index < 0:
		current_type_index = TYPES.size() - 1
	type_label.text = TYPES.keys()[current_type_index]

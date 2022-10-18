extends Node2D

enum TYPES {BALL, STICK, HELMET}
var current_type = "BALL"
var current_index = {
	"BALL": 0,
	"STICK": 0,
	"HELMET": 0,
}

onready var type_label = $TypeLabel

func _ready():
	current_index["BALL"] = ShopUtil.items["BALL"]["selected"]
	$Player/BALL.texture = ShopUtil.get_ball_texture()
	$Player/STICK.texture = ShopUtil.get_texture("STICK")
	$Player/HELMET.texture = ShopUtil.get_texture("HELMET")
	$CenterContainer/VBoxContainer/Buy.text = "SELECTED"

func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Buy_pressed():
	Global.click()
	# current item price as parameter
#	Global.use_coins(current_item_index)
	ShopUtil.select(current_type, current_index[current_type])
	_select()


func _on_PrevItem_pressed():
	Global.click()
	current_index[current_type] -= 1
	if current_index[current_type] < 0:
		current_index[current_type] = ShopUtil.items[current_type]["list"].size() - 1
	_select()
	


func _on_NextItem_pressed():
	Global.click()
	current_index[current_type] += 1
	if current_index[current_type] > ShopUtil.items[current_type]["list"].size() - 1:
		current_index[current_type] = 0
	_select()


func _on_PrevType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	current_type = TYPES.keys()[current_index[current_type]]
	type_label.text = current_type
	

func _on_NextType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index -= 1
	if current_type_index < 0:
		current_type_index = TYPES.size() - 1
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type

func _select():
	if current_index[current_type] == ShopUtil.items[current_type]["selected"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECTED"
	elif current_index[current_type] in ShopUtil.items[current_type]["unlocked"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECT"
	else:
		$CenterContainer/VBoxContainer/Buy.text = "BUY"
	get_node("Player/" + current_type).texture = ShopUtil.get_texture(current_type,current_index[current_type])

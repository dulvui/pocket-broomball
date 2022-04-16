extends Node2D

enum TYPES {BALLS, STICKS, HELMETS, GLOVES, FIELDS}

var current_type_index = 0
var current_item_index = 0


onready var type_label = $TypeLabel

func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Buy_pressed():
	Global.click()
	# current item price as parameter
	Global.use_coins(current_item_index)


func _on_PrevItem_pressed():
	Global.click()


func _on_NextItem_pressed():
	Global.click()


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

extends Node2D

enum TYPES {BALL, STICK, HELMET}
var current_type = "BALL"
var current_index = {
	"BALL": 0,
	"STICK": 0,
	"HELMET": 0,
}

onready var type_label = $Type/Label

func _ready():
	current_index["BALL"] = ShopUtil.items["BALL"]["selected"]
	$CurrentItem.texture = ShopUtil.get_ball_texture()
	$Ball.texture = ShopUtil.get_ball_texture()
	$CenterContainer/VBoxContainer/Buy.text = "SELECTED"

func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Buy_pressed():
	Global.click()
	ShopUtil.select(current_type, current_index[current_type])
	
	if $Locker.visible:
		$Locker.play("open")
		yield($Locker,"animation_finished")
		$Locker.play("idle")
		$Locker.hide()
		$Price.hide()

	_update()


func _on_PrevItem_pressed():
	Global.click()
	current_index[current_type] -= 1
	if current_index[current_type] < 0:
		current_index[current_type] = ShopUtil.items[current_type]["list"].size() - 1
	_update()
	

func _on_NextItem_pressed():
	Global.click()
	current_index[current_type] += 1
	if current_index[current_type] > ShopUtil.items[current_type]["list"].size() - 1:
		current_index[current_type] = 0
	_update()

func _on_PrevType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	current_type = TYPES.keys()[current_index[current_type]]
	type_label.text = current_type
	_update()
	

func _on_NextType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index -= 1
	if current_type_index < 0:
		current_type_index = TYPES.size() - 1
	current_type = TYPES.keys()[current_type_index]
	type_label.text = current_type
	_update()

func _update():
	# update button text
	if current_index[current_type] == ShopUtil.items[current_type]["selected"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECTED"
		$Locker.hide()
		$Price.hide()
	elif current_index[current_type] in ShopUtil.items[current_type]["unlocked"]:
		$CenterContainer/VBoxContainer/Buy.text = "SELECT"
		$Locker.hide()
		$Price.hide()
	else:
		$Locker.show()
		$Price.show()
		$Price.text = str(ShopUtil.items[current_type]["list"][current_index[current_type]]["price"])
		$CenterContainer/VBoxContainer/Buy.text = "BUY"
	
	# update textures
	$AnimatedBody.change_style()
	$CurrentItem.texture = ShopUtil.get_texture(current_type,current_index[current_type])
	$Ball.texture = ShopUtil.get_ball_texture()
	
	# scale if not ball
	if current_type == "BALL":
		$CurrentItem.scale = Vector2(4,4)
	else:
		$CurrentItem.scale = Vector2(8,8)

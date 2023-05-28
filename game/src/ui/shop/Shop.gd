extends Node2D

enum TYPES {BALL, STICK, HELMET}
var current_type = "BALL"
var current_index = {
	"BALL": 0,
	"STICK": 0,
	"HELMET": 0,
}

onready var type_label = $Content/Type/Label

onready var animation_player:AnimationPlayer = $AnimationPlayer

func _ready():
	current_index["BALL"] = ShopUtil.items["BALL"]["selected"]
	$Content/CurrentItem.texture = ShopUtil.get_ball_texture()
	$Content/Ball.texture = ShopUtil.get_ball_texture()
	$Content/CenterContainer/VBoxContainer/Buy.text = "SELECTED"
	animation_player.play("FadeIn")

func _on_GoBack_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Buy_pressed():
	Global.click()
	var success = ShopUtil.select(current_type, current_index[current_type])
	
	if $Content/Locker.visible and success:
		$Content/Locker.play("open")
		yield($Content/Locker,"animation_finished")
		$Content/Locker.play("idle")
		$Content/Locker.hide()
		$Content/Price.hide()

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
	if current_index[current_type] >= ShopUtil.items[current_type]["list"].size():
		current_index[current_type] = 0
	_update()

func _on_PrevType_pressed():
	Global.click()
	var current_type_index = TYPES.keys().find(current_type)
	current_type_index += 1
	if current_type_index >= TYPES.size():
		current_type_index = 0
	current_type = TYPES.keys()[current_type_index]
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
		$Content/CenterContainer/VBoxContainer/Buy.text = "SELECTED"
		$Content/Locker.hide()
		$Content/Price.hide()
	elif current_index[current_type] in ShopUtil.items[current_type]["unlocked"]:
		$Content/CenterContainer/VBoxContainer/Buy.text = "SELECT"
		$Content/Locker.hide()
		$Content/Price.hide()
	else:
		$Content/Locker.show()
		$Content/Price.show()
		$Content/Price.text = str(ShopUtil.items[current_type]["list"][current_index[current_type]]["price"])
		$Content/CenterContainer/VBoxContainer/Buy.text = "BUY"
	
	# update textures
	$Content/AnimatedBody.change_style()
	$Content/CurrentItem.texture = ShopUtil.get_texture(current_type,current_index[current_type])
	$Content/Ball.texture = ShopUtil.get_ball_texture()
	
	# scale if not ball
	if current_type == "BALL":
		$Content/CurrentItem.scale = Vector2(4,4)
	else:
		$Content/CurrentItem.scale = Vector2(8,8)

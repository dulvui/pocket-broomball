# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

onready var speed_bar:TextureProgress = $VBoxContainer/Speed/TextureProgress
onready var power_bar:TextureProgress = $VBoxContainer/Power/TextureProgress
onready var freeze_bar:TextureProgress = $VBoxContainer/Freeze/TextureProgress

onready var speed_up_button:Button = $VBoxContainer/Speed/SpeedUp
onready var freeze_up_button:Button = $VBoxContainer/Freeze/FreezeUp
onready var power_up_button:Button = $VBoxContainer/Power/PowerUp

onready var animation_player:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	speed_up_button.text = str(_get_price(Global.arcade_speed))
	freeze_up_button.text = str(_get_price(Global.arcade_freeze))
	power_up_button.text = str(_get_price(Global.arcade_power))

	animation_player.play("Highscore")
	
	speed_bar.value = Global.arcade_speed
	power_bar.value = Global.arcade_power
	freeze_bar.value = Global.arcade_freeze
	
	$VBoxContainer/Highscore.text = str(Global.arcade_highscore)
	

func _get_price(n:int) -> String:
	return str(_get_price_int(n))
	
func _get_price_int(n:int) -> int:
	if n == 10:
		return -1
	var price = 1000
	for i in n - 1:
		price *= 2
	return price

func _on_Play_pressed() -> void:
	
	Global.away_team_speed = 2.3
	Global.away_team_power = 2.3
	
	Global.home_team_speed = Global.arcade_speed
	Global.home_team_power = Global.arcade_power
	
	Global.set_home_team({})
	Global.set_away_team({})
	Global.click()
	
	get_tree().change_scene("res://src/ui/game/arcade/Arcade.tscn")


func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


func _on_SpeedUp_pressed() -> void:
	Global.click()
	if Global.arcade_speed < 10 and Global.use_coins(_get_price_int(Global.arcade_speed)):
		Global.arcade_speed += 1
		speed_up_button.text = str(_get_price(Global.arcade_speed))
		speed_bar.value = Global.arcade_speed
		Global.save_all_data()

func _on_PowerUp_pressed() -> void:
	Global.click()
	if Global.arcade_power < 10 and Global.use_coins(_get_price_int(Global.arcade_power)):
		Global.arcade_power += 1
		power_up_button.text = str(_get_price(Global.arcade_power))
		power_bar.value = Global.arcade_power
		Global.save_all_data()


func _on_FreezeUp_pressed() -> void:
	Global.click()
	if Global.arcade_freeze < 10 and Global.use_coins(_get_price_int(Global.arcade_freeze)):
		Global.arcade_freeze += 1
		freeze_up_button.text = str(_get_price(Global.arcade_freeze))
		freeze_bar.value = Global.arcade_freeze
		Global.save_all_data()

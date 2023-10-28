extends Control

var speed_bar
var power_bar
var freeze_bar

var speed_up_button
var power_up_button
var freeze_up_button

var animation_player

func _ready():
	speed_bar = $MarginContainer/VBoxContainer/Speed/TextureProgress
	power_bar = $MarginContainer/VBoxContainer/Power/TextureProgress
	freeze_bar = $MarginContainer/VBoxContainer/Freeze/TextureProgress
	
	speed_up_button = $MarginContainer/VBoxContainer/Speed/SpeedUp
	freeze_up_button = $MarginContainer/VBoxContainer/Freeze/FreezeUp
	power_up_button = $MarginContainer/VBoxContainer/Power/PowerUp

	speed_up_button.text = str(_get_price(Global.arcade_speed))
	freeze_up_button.text = str(_get_price(Global.arcade_freeze))
	power_up_button.text = str(_get_price(Global.arcade_power))
	
	animation_player = $AnimationPlayer
	animation_player.play("Highscore")
	
	speed_bar.value = Global.arcade_speed
	power_bar.value = Global.arcade_power
	freeze_bar.value = Global.arcade_freeze
	
	if OS.get_name() == "iOS":
		$MarginContainer/VBoxContainer/OnlineHighscore.show()
		
	
	$MarginContainer/VBoxContainer/Highscore.text = str(Global.arcade_highscore)

	animation_player.play("FadeIn")

func _get_price(n):
	if n == 10:
		return "max"
	var price = 1000
	for i in n - 1:
		price *= 2
	return price

func _on_Play_pressed():
	
	Global.away_team_speed = 2.3
	Global.away_team_power = 2.3
	
	Global.home_team_speed = Global.arcade_speed
	Global.home_team_power = Global.arcade_power
	
	Global.set_home_team(null)
	Global.set_away_team(null)
	
	
	Global.click()
	
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/game/arcade/Arcade.tscn")


func _on_GoBack_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


func _on_SpeedUp_pressed():
	Global.click()
	if Global.arcade_speed < 10 and Global.use_coins(_get_price(Global.arcade_speed)):
		Global.arcade_speed += 1
		speed_up_button.text = str(_get_price(Global.arcade_speed))
		speed_bar.value = Global.arcade_speed
		Global.save_all_data()

func _on_PowerUp_pressed():
	Global.click()	
	if Global.arcade_power < 10 and Global.use_coins(_get_price(Global.arcade_power)):
		Global.arcade_power += 1
		power_up_button.text = str(_get_price(Global.arcade_power))
		power_bar.value = Global.arcade_power
		Global.save_all_data()


func _on_FreezeUp_pressed():
	Global.click()
	if Global.arcade_freeze < 10 and Global.use_coins(_get_price(Global.arcade_freeze)):
		Global.arcade_freeze += 1
		freeze_up_button.text = str(_get_price(Global.arcade_freeze))
		freeze_bar.value = Global.arcade_freeze
		Global.save_all_data()


func _on_OnlineHighscore_pressed():
	Global.click()

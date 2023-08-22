extends Node2D

var animation_player

func _ready():
	animation_player = $AnimationPlayer
	
	if Global.show_pop_up:
		$Content/PopupDialog.popup()
		$Content/MarginContainer.hide()
		
	if OS.get_name() == "iOS":
		$Content/MarginContainer/VBoxContainer/Exit.hide()
	
	if Global.first_fade_in:
		Global.first_fade_in = false
		Global.fade_in_goals()
	
	animation_player.play("FirstFadeIn")
	



func _on_Settings_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/settings/Settings.tscn")

func _on_Statistics_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/statistics/Statistics.tscn")
	

func _on_Play_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


func _on_Shop_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/shop/Shop.tscn")


func _on_Exit_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	Global.save_all_data()
	get_tree().quit()


func _on_PopupDialog_popup_hide():
	Global.show_pop_up = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Online_pressed():
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/online/OnlineDashboard.tscn")

func _on_Okay_pressed():
	$Content/PopupDialog.hide()


func _on_SimonDalvai_pressed():
	Global.click()
	OS.shell_open("https://simondalvai.org")


func _on_Info_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/info/Info.tscn")


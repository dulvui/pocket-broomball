extends Control

func _ready():
	if OS.get_name() == "iOS":
		$VBoxContainer/Exit.hide()
	
	if Global.first_fade_in:
		Global.first_fade_in = false
		Global.fade_in_goals()


func _on_Settings_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/settings/Settings.tscn")

func _on_Statistics_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/statistics/Statistics.tscn")
	

func _on_Play_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


func _on_Shop_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/shop/Shop.tscn")


func _on_Exit_pressed():
	Global.click()
	Global.save_all_data()
	get_tree().quit()


func _on_PopupDialog_popup_hide():
	Global.show_pop_up = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Online_pressed():
	get_tree().change_scene("res://src/ui/online/OnlineDashboard.tscn")

func _on_Okay_pressed():
	$PopupDialog.hide()

func _on_Info_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/info/Info.tscn")


func _on_SimonDalvai_pressed():
	Global.click()
	OS.shell_open("https://simondalvai.org")


func _on_Codeberg_pressed():
	Global.click()
	OS.shell_open("https://codeberg.org/dulvui/pocket-broomball")


func _on_Mastodon_pressed():
	Global.click()
	OS.shell_open("https://mastodon.social/@dulvui")


func _on_Github_pressed():
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball")


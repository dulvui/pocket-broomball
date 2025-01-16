# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

const LANGUAGES: Dictionary = {
	"en" : "English",
	"de" : "Deutsch",
	"it" : "Italiano",
	"fr" : "Français",
	"es" : "Español",
}

const FLAGS: Dictionary = {
	"en" : "usa.png",
	"de" : "germany.png",
	"it" : "italy.png",
	"fr" : "france.png",
	"es" : "spain.png",
}

onready var flag: TextureRect = $VBoxContainer/Language/Flag


func _ready() -> void:
	$VBoxContainer/RoundLimit.set_text(tr("ROUNDLIMIT") + " " +str(Global.round_limit))
	
	update_dynamic_labels()


func _on_RoundLimit_pressed() -> void:
	Global.click()
	round_limit_up()
	$VBoxContainer/RoundLimit.set_text(tr("ROUNDLIMIT")+ " " +str(Global.round_limit))


func _on_Music_pressed() -> void:
	Global.toggle_music()
	
	if Global.music == "chill":
		$VBoxContainer/Music.text = tr("MUSIC_1")
	elif Global.music == "energetic":
		$VBoxContainer/Music.text = tr("MUSIC_2")
	else:
		$VBoxContainer/Music.text = tr("MUSIC_OFF")
		
	if Global.sfx:
		Global.click()


func _on_Sfx_pressed() -> void:
	if Global.sfx:
		$VBoxContainer/Sfx.text = tr("SFX_OFF")
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sfx"), true)
		set_sfx(false)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sfx"), false)
		$VBoxContainer/Sfx.text = tr("SFX_ON")
		set_sfx(true)
	if Global.sfx:
		Global.click()


func set_music(type: String) -> void:
	Global.music = type
	
	if Global.music:
		Global.music_loop.fade_in()
	else:
		Global.music_loop.fade_out()
		
	Global.config.set_value("sound","music",Global.music)
	Global.save()


func set_sfx(enabled: bool) -> void:
	Global.sfx = enabled
	Global.config.set_value("sound","sfx",Global.sfx)
	Global.save()
	

func round_limit_up() -> void:
	Global.round_limit += 1
	if Global.round_limit > 9:
		Global.round_limit = 1
	Global.config.set_value("round_limit", "amount",Global.round_limit)
	Global.save()


func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_MoreGames_pressed() -> void:
	Global.click()
	if OS.get_name() == "iOS":
		OS.shell_open("https://appstore.com/simondalvai")
	else:
		OS.shell_open("https://play.google.com/store/apps/dev?id=7836644900810357474&hl=en")


func _on_EasterEgg_button_down():
	$EasterEggTimer.start()


func _on_EasterEgg_button_up():
	$EasterEggTimer.stop()


func _on_EasterEggTimer_timeout():
	Global.add_coins(50000)
	

func _on_Join_pressed():
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball#join-with-your-broomball-team")



func _on_Language_pressed():
	var locale = Global.locale
	
	match locale:
		"en":
			locale = "de"
		"de":
			locale = "it"
		"it":
			locale = "fr"
		"fr":
			locale = "es"
		_:
			locale = "en"
		
	TranslationServer.set_locale(locale)
	Global.locale = locale
	Global.save_all_data()
	update_dynamic_labels()
	
func update_dynamic_labels():
	$VBoxContainer/Language.text = LANGUAGES[Global.locale]
	flag.texture = load("res://assets/teams/national-teams/" + FLAGS[Global.locale])
	
	$VBoxContainer/RoundLimit.set_text(tr("ROUNDLIMIT")+ " " +str(Global.round_limit))
	
	# update music and sfx labels
	if Global.music == "chill":
		$VBoxContainer/Music.text = tr("MUSIC_1")
	elif Global.music == "energetic":
		$VBoxContainer/Music.text = tr("MUSIC_2")
	else:
		$VBoxContainer/Music.text = tr("MUSIC_OFF")
		
	if Global.sfx:
		$VBoxContainer/Sfx.text = tr("SFX_ON")
	else:
		$VBoxContainer/Sfx.text = tr("SFX_OFF")

func _on_Info_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/info/Info.tscn")


func _on_ResetTeams_pressed():
	Global.teams_mods = {}
	Global.save_all_data()

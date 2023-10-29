extends Control

const LANGUAGES = {
	"en" : "English",
	"de" : "Deutsch",
	"it" : "Italiano",
	"fr" : "Français",
	"es" : "Español",
}

onready var animation_player = $AnimationPlayer

func _ready():
	$VBoxContainer/RoundLimit.set_text("roundlimit "+str(Global.round_limit))
	
	update_dynamic_labels()
	
	if Global.FDROID:
		$VBoxContainer/RateAndReview.hide()
		
	animation_player.play("FadeIn")
		

func _on_RoundLimit_pressed():
	Global.click()
	round_limit_up()
	$VBoxContainer/RoundLimit.set_text("roundlimit "+str(Global.round_limit))


func _on_Music_pressed():
	Global.toggle_music()
	
	if Global.music == "chill":
		$VBoxContainer/Music.text = tr("MUSIC_1")
	elif Global.music == "energetic":
		$VBoxContainer/Music.text = tr("MUSIC_2")
	else:
		$VBoxContainer/Music.text = tr("MUSIC_OFF")
		
	if Global.sfx:
		Global.click()
	
	
func _on_Sfx_pressed():
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
		
func set_music(enabled):
	Global.music = enabled
	
	if Global.music:
		Global.music_loop.fade_in()
	else:
		Global.music_loop.fade_out()
		
	Global.config.set_value("sound","music",Global.music)
	Global.save()
	
func set_sfx(enabled):
	Global.sfx = enabled
	Global.config.set_value("sound","sfx",Global.sfx)
	Global.save()
	

func round_limit_up():
	Global.round_limit += 1
	if Global.round_limit > 9:
		Global.round_limit = 1
	Global.config.set_value("round_limit", "amount",Global.round_limit)
	Global.save()

func _on_RateAndReview_pressed():
	Global.click()
	if OS.get_name() == "iOS":
		OS.shell_open("https://itunes.apple.com/app/id1511009171?action=write-review")
	else:
		OS.shell_open("https://play.google.com/store/apps/details?id=com.salvai.broomball")


func _on_GoBack_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_MoreGames_pressed():
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
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/info/Info.tscn")

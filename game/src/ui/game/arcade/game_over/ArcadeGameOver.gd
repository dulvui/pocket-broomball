extends Control

var revived = false

var _coins = 0
var _score = 0

onready var animation_player = $AnimationPlayer

func _ready():
	if OS.get_name() == "iOS":
		$CenterContainer/MarginContainer/VBoxContainer/Highscore.show()

	
func is_highscore(highscore):
	if highscore:
		$Highscore.play()
		$NewHighscore.show()

func set_collected_coins_and_score(collected_coins,score):
	_coins = collected_coins
	_score = score
	$HBoxContainer/Coins.text = str(collected_coins * 50) + "x" + str(score) 
	Global.music_loop.fade_in()
	
func _on_Replay_pressed():
	Global.click()
	Global.add_coins(_coins * 50 * _score)
	animation_player.play("FadeOut")
	yield(animation_player,"animation_finished")
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/game/arcade/Arcade.tscn")


func _on_Continue_pressed():
	Global.click()
	Global.add_coins(_coins * 50 * _score)
	animation_player.play("FadeOut")
	yield(animation_player,"animation_finished")
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/game/arcade/ArcadeDashboard.tscn")

func _on_Revive_pressed():
	Global.click()
	Global.music_loop.fade_out()
	
	

func _on_GameOver_visibility_changed():
	if revived:
		$CenterContainer/MarginContainer/VBoxContainer/Revive.hide()
	animation_player.play("FadeIn")


func _on_Highscore_pressed():
	pass

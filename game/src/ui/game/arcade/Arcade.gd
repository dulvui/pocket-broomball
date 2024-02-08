# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var coins_bonus = preload("res://src/ui/game/arcade/powerups/Coins.tscn")
var freeze = preload("res://src/ui/game/arcade/powerups/Freeze.tscn")

onready var score_label:Label = $Score
onready var powerup_timer:Timer = $PowerUpTimer
onready var effect_timer:Timer = $EffectTimer

var game_over:bool = false
var score:int = 0
var collected_coins:int = 0


func _ready() -> void:
	get_tree().paused = false
	TouchHelper.reset()
	effect_timer.wait_time = Global.arcade_freeze
	
	score_label.text = str(0)
	
	
	if Global.music:
		Global.music_loop.fade_out()
	if Global.sfx:
		$Field/Sounds/Crowd.play()
	
	powerup_timer.start()


func _on_Goals_away_goal() -> void:
	$Ball/RigidBody2D.on_away_goal()
	get_tree().paused = true
	if score > Global.arcade_highscore:
		Global.arcade_highscore = score
		$GameOver.is_highscore(true)
	else:
		$GameOver.is_highscore(false)
		
	Global.save_all_data()
	$Pause.hide()
	$GameOver.set_collected_coins_and_score(collected_coins,score)
	$GameOver.show()


func _on_Goals_home_goal() -> void:
	score += 1
	score_label.text = str(score)
	$Computer.freeze = false
	$Computer.level_up()
	$Field.goal_sound()
	$Ball/RigidBody2D.on_home_goal()


func _on_PowerUpTimer_timeout() -> void:
	var powerup
	if randi() % 2:
#	if 1 == 0:
		powerup = freeze.instance()
		powerup.connect("freeze",self,"_freeze_computer")
	else:
		powerup = coins_bonus.instance()
		powerup.connect("coins_bonus",self,"_coins_bonus")
	powerup.position = Vector2(randi()%600+60,randi()%520+60)
	$PowerUps.add_child(powerup)
	powerup_timer.start(randi()%10+10)

func _freeze_computer() -> void:
	$Computer.freeze = true
	effect_timer.start()

func _coins_bonus() -> void:
	collected_coins += 1

func _on_EffectTimer_timeout() -> void:
	$Computer.freeze = false

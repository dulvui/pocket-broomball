extends Node2D


var game_over = false

var score = 0
var score_label

var collected_coins = 0

var powerup_timer
var effect_timer

var freeze = preload("res://src/ui/game/arcade/powerups/Freeze.tscn")
var coins_bonus = preload("res://src/ui/game/arcade/powerups/Coins.tscn")

func _ready():
	get_tree().paused = false
	TouchHelper.reset()
	
	powerup_timer = $PowerUpTimer
	effect_timer = $EffectTimer
	effect_timer.wait_time = Global.arcade_freeze
	
	score_label = $Score
	score_label.text = str(0)
	
	
	if Global.music:
		Global.music_loop.fade_out()
	if Global.sfx:
		$Field/Sounds/Crowd.play()
	
	powerup_timer.start()


func _on_Goals_away_goal():
	$Ball/RigidBody2D.on_away_goal()
	get_tree().paused = true
	if score > Global.arcade_highscore:
		Global.arcade_highscore = score
		$GameOver.is_highscore(true)
	else:
		$GameOver.is_highscore(false)
		
	GameServices.submit_arcade_score(score)
		
	Global.save_all_data()
	$Pause.hide()
	$GameOver.set_collected_coins_and_score(collected_coins,score)
	$GameOver.show()


func _on_Goals_home_goal():
	score += 1
	score_label.text = str(score)
	$Computer.freeze = false
	$Computer.level_up()
	$Field.goal_sound()
	$Ball/RigidBody2D.on_home_goal()


func _on_PowerUpTimer_timeout():
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

func _freeze_computer():
	$Computer.freeze = true
	effect_timer.start()

func _coins_bonus():
	collected_coins += 1

func _on_EffectTimer_timeout():
	$Computer.freeze = false

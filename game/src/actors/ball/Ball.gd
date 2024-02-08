# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends RigidBody2D

class_name Ball

var max_speed:int = 1800

var reset_home:bool
var reset_away:bool
var stop_home:bool
var stop_away:bool

var computer:Node2D

onready var hit_sound:AudioStreamPlayer2D = $HitSound

func _ready() -> void:
	if get_parent().singleplayer:
		computer = get_parent().get_parent().get_node("Computer")
#to set max speed of ball

func _integrate_forces(state:Physics2DDirectBodyState) -> void:
	if abs(get_linear_velocity().x) > max_speed or abs(get_linear_velocity().y) > max_speed:
		var new_speed:Vector2 = get_linear_velocity().normalized()
		new_speed *= max_speed
		state.linear_velocity = new_speed
	
	if get_parent().singleplayer:
		look_at(computer.position)
		
	if stop_home:
		state.linear_velocity = Vector2.ZERO
		state.transform = Transform2D(0, Vector2(360, -50))
		stop_home = false
		
	if stop_away:
		state.linear_velocity = Vector2.ZERO
		state.transform = Transform2D(0, Vector2(360, 1300))
		stop_away = false
		
	if reset_home:
		state.linear_velocity = Vector2.ZERO
		state.transform = Transform2D(0, Vector2(360,440))
		reset_home = false
		show()
		
	if reset_away:
		state.linear_velocity = Vector2.ZERO
		state.transform = Transform2D(0, Vector2(360,840))
		reset_away = false
		show()
		

func on_home_goal() -> void:
	hide()
	stop_home = true
	yield(get_tree().create_timer(1.5), "timeout")
	reset_home = true
	
	
func on_away_goal() -> void:
	hide()
	stop_away = true
	yield(get_tree().create_timer(1.5), "timeout")
	reset_away = true
	
func _on_RigidBody2D_body_entered(body:Node) -> void:
	var speed:float = linear_velocity.length()
	if body is Computer || body is Player:
		var impulse:Vector2 = (global_position - body.global_position).normalized() * Global.power_factor  * body.power
		speed = impulse.length()
		apply_central_impulse(impulse)
		body.animation_player.play("Shoot")
	if Global.sfx:
		hit_sound.hit(speed)

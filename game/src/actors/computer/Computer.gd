# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends KinematicBody2D
class_name Computer

export var opposite:bool = false

var speed:int = 1
var power:int = 1

var destination:Vector2
var direction:Vector2
var hit_pos:Position2D

var freeze:bool = false

onready var animation_player:AnimationPlayer = $Body/AnimationPlayer
onready var player:Player = get_parent().get_node("Player");
onready var ball:RigidBody2D = get_parent().get_node("Ball").get_node("RigidBody2D");


func _ready() -> void:
	if Global.away_team_speed: 
		speed = Global.away_team_speed / 3
	if Global.away_team_power: 
		power = Global.away_team_power
	if opposite:
		hit_pos = ball.get_node("ComputerHitPosition2")
	else:
		hit_pos = ball.get_node("ComputerHitPosition")

func _physics_process(delta:float) -> void:
	var ballpos:Vector2 = ball.global_position
	
	if opposite:
		if ballpos.y > 640  and ballpos.y < global_position.y:
			destination = hit_pos.global_position
		else:
			destination = Vector2(ballpos.x,1280 - 120)
	else:
		if ballpos.y < 640  and ballpos.y > global_position.y:
			destination = hit_pos.global_position
		else:
			destination = Vector2(ballpos.x,120)
	
	direction = (destination - global_position).normalized()
	var distance_to_player = global_position.distance_to(destination)
	if not freeze:
		move_and_slide(direction * speed* Global.speed_factor * distance_to_player)
	else:
		move_and_slide(direction * speed* Global.speed_factor * distance_to_player * 0.1)
		
	look_at(ballpos)


func _on_ChargeDetector_body_entered(body:Node) -> void:
	animation_player.play("Charge")

func level_up() -> void:
	speed += 0.05
	power += 0.05
	if speed > 3.5:
		speed = 3.5
	if power > 4:
		power = 4

func _on_ChargeDetector_body_exited(body:Node) -> void:
	animation_player.play("Shoot")

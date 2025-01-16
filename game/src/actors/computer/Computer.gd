# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends KinematicBody2D
class_name Computer

const MAX_SHOOT_TIME: float = 0.8

export var lower_half: bool = false

var speed: float = 1.0
var power: int = 1

var destination: Vector2
var direction: Vector2
var hit_pos: Position2D

var freeze: bool = false

var shooting_time: float = 0

onready var animation_player: AnimationPlayer = $Body/AnimationPlayer
onready var ball: RigidBody2D = get_parent().get_node("Ball").get_node("RigidBody2D")


func _ready() -> void:
	if lower_half:
		speed = Global.home_team_speed / 3
		power = Global.home_team_power
		hit_pos = ball.get_node("ComputerHitPosition2")
	else:
		speed = Global.away_team_speed / 3
		power = Global.away_team_power
		hit_pos = ball.get_node("ComputerHitPosition")


func _physics_process(delta: float) -> void:
	var ballpos: Vector2 = ball.global_position
	
	var is_shooting: bool = false

	# set destination
	if lower_half:
		if ballpos.y > 640 and ballpos.y < global_position.y:
			destination = hit_pos.global_position
			is_shooting = true
		else:
			destination = Vector2(ballpos.x, 1280 - 120)
	else:
		if ballpos.y < 640 and ballpos.y > global_position.y:
			destination = hit_pos.global_position
			is_shooting = true
		else:
			destination = Vector2(ballpos.x, 120)
	
	
	if is_shooting:
		shooting_time += delta
	
	# set direction
	if is_shooting and shooting_time > MAX_SHOOT_TIME:
		# away from ball
		direction = destination.direction_to(global_position)
	else:
		# towards ball
		direction = global_position.direction_to(destination)
	
	# move
	var distance: float = global_position.distance_to(destination)
	if freeze:
		move_and_slide(direction * speed * Global.speed_factor * distance * 0.1)
	else:
		move_and_slide(direction * speed * Global.speed_factor * distance)
		
	look_at(ballpos)


func _on_ChargeDetector_body_entered(body: Node) -> void:
	animation_player.play("Charge")


func level_up() -> void:
	speed += 0.05
	power += 0.05
	if speed > 3.5:
		speed = 3.5
	if power > 4:
		power = 4


func _on_ChargeDetector_body_exited(body: Node) -> void:
	animation_player.play("Shoot")
	shooting_time = 0

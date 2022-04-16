extends KinematicBody2D

class_name Player

onready var ball = get_parent().get_node("Ball").get_node("RigidBody2D");

export var away = false
export var oneVsOne = false

var direction

var power

var destination = null

var animation_player

func _ready():
	animation_player = $Body/AnimationPlayer
	power = Global.home_team_power
	direction = (ball.global_position - global_position).normalized()

func _physics_process(delta):
	if oneVsOne:
		if away and TouchHelper.away_pressed:
			destination = TouchHelper.state["away"]
		elif !away and TouchHelper.home_pressed:
			destination = TouchHelper.state["home"]
	elif TouchHelper.home_pressed:
			destination = TouchHelper.state["home"]
	if destination != null:
		direction = (destination - global_position).normalized()
		var distance_to_player = global_position.distance_to(destination)
		move_and_slide(direction * Global.home_team_speed  * Global.speed_factor * distance_to_player)
		
		if distance_to_player > 10:
			look_at(ball.global_position)

func _on_ChargeDetector_body_entered(body):
	animation_player.play("Charge")


func _on_AnimatedSprite_animation_finished():
	animation_player.play("Idle")


func _on_ChargeDetector_body_exited(body):
	animation_player.play("Idle")

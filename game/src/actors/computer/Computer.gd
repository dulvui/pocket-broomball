extends KinematicBody2D
class_name Computer

export var opposite = false

var speed = 1
var power = 1

var destination
var direction

var freeze = false

onready var player = get_parent().get_node("Player");
onready var  ball = get_parent().get_node("Ball").get_node("RigidBody2D");
var hit_pos

var animation_player

func _ready():
	animation_player = $Body/AnimationPlayer
	if Global.away_team_speed: 
		speed = Global.away_team_speed / 3
	if Global.away_team_power: 
		power = Global.away_team_power
	if opposite:
		hit_pos = ball.get_node("ComputerHitPosition2")
	else:
		hit_pos = ball.get_node("ComputerHitPosition")

func _physics_process(delta):
	var ballpos = ball.global_position
	
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


func _on_ChargeDetector_body_entered(body):
	animation_player.play("Charge")

func level_up():
	speed += 0.05
	power += 0.05
	if speed > 3.5:
		speed = 3.5
	if power > 4:
		power = 4

func _on_ChargeDetector_body_exited(body):
	animation_player.play("Shoot")

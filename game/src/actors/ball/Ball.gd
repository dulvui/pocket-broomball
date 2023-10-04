extends RigidBody2D

class_name Ball

var max_speed = 1800

var reset_home
var reset_away
var stop_home
var stop_away

var computer

onready var hit_sound:AudioStreamPlayer2D = $HitSound

func _ready():
	if get_parent().singleplayer:
		computer = get_parent().get_parent().get_node("Computer")
#to set max speed of ball

func _integrate_forces(state):
	if abs(get_linear_velocity().x) > max_speed or abs(get_linear_velocity().y) > max_speed:
		var new_speed = get_linear_velocity().normalized()
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
		

func on_home_goal():
	hide()
	stop_home = true
	yield(get_tree().create_timer(1.5), "timeout")
	reset_home = true
	
	
func on_away_goal():
	hide()
	stop_away = true
	yield(get_tree().create_timer(1.5), "timeout")
	reset_away = true
	
func _on_RigidBody2D_body_entered(body):
	if body is Computer || body is Player:
		apply_central_impulse((global_position - body.global_position).normalized() * Global.power_factor  * body.power)
		body.animation_player.play("Shoot")
	if Global.sfx:
		hit_sound.play()

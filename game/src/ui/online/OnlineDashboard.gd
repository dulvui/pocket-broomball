extends Node2D

#func _ready():
#  Server.set_up()

func _physics_process(delta):
	if TouchHelper.home_pressed:
		Server.set_pos(TouchHelper.state["home"])
		
#	if Server.remote_ball_pos != null:
#		$Ball.position = Server.remote_ball_pos
#
#	if Server.away_pos != null:
#		$Player2.position = Server.away_pos
#
#	if Server.touch_pos != null:
#		$Player.position = Server.touch_pos


func _on_connection_failed(error):
  print("Error connecting to server " + error)


func _on_SearchGame_pressed():
	print("pla")
#	Server.search_game()


func _on_GoBack_pressed():
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

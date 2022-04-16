extends Node

puppet var remote_ball_pos
puppet var away_pos
puppetsync var touch_pos

func set_up():
	var network = NetworkedMultiplayerENet.new()
	network.create_client("192.168.1.12", 4242)
	get_tree().set_network_peer(network)
#	network.connect("connection_failed",self,"_on_connection_failed")

func search_game():
	rpc_id(1,"search_game")
	
func set_pos(pos):
#	rpc_unreliable_id(1,"touch_pos",get_tree().get_network_unique_id(),pos)
	rset_unreliable("touch_pos", pos)
	
remote func away_pos(pos):
	away_pos = pos

remote func ball_pos(pos):
#	print(pos)
	remote_ball_pos = pos

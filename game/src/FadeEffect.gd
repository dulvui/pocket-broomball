extends Tween

const DURATON:float = 0.2

export var node_path:NodePath
export var node_path2:NodePath

var node:Node
var node2:Node

func _ready():
	if node_path:
		node = get_node(node_path)
	
	if node_path2:
		node2 = get_node(node_path2)
	
	if node:
		node.modulate = Color(1, 1, 1, 0)
	if node2:
		node2.modulate = Color(1, 1, 1, 0)
		
	fade_in()

func fade_in():
	if node:
		interpolate_property(node, "modulate", 
		Color(1, 1, 1, 0), Color(1, 1, 1, 1), DURATON, 
		Tween.TRANS_LINEAR, Tween.EASE_IN)
		start()
	if node2:
		interpolate_property(node2, "modulate", 
		Color(1, 1, 1, 0), Color(1, 1, 1, 1), DURATON, 
		Tween.TRANS_LINEAR, Tween.EASE_IN)
		start()

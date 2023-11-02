extends Tween

const DURATON:float = 0.2

export var node_path:NodePath
var node:Control

func _ready():
	node = get_node(node_path)
	node.modulate = Color(1, 1, 1, 0)

func fade_in():
	interpolate_property(node, "modulate", 
	Color(1, 1, 1, 0), Color(1, 1, 1, 1), DURATON, 
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	start()
	
func fade_out():
	interpolate_property(node, "modulate", 
	Color(1, 1, 1, 1), Color(1, 1, 1, 0), DURATON, 
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	start()
	yield(self, "tween_completed")

extends Tween

func fade_in(node):
	interpolate_property(node, "modulate", 
	Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.1, 
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	start()
	
func fade_out(node):
	interpolate_property(node, "modulate", 
	Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.1, 
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	start()
	

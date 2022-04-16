extends Label


var goals = 0
	
	
func goal():
	goals += 1
	set_text(str(goals))

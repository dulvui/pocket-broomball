extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for league in Global.league_stats:
		var name_label = Label.new()
		name_label.set_text(league)
		$GridContainer.add_child(name_label)
		
		var played_label = Label.new()
		played_label.set_text(str(Global.league_stats[league]["played"]))
		$GridContainer.add_child(played_label)
		
		var win_label = Label.new()
		win_label.set_text(str(Global.league_stats[league]["win"]))
		$GridContainer.add_child(win_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Menu_pressed():
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

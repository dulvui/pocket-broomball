extends Control

onready var statistics:GridContainer = $Statistics

func _ready():
	for league in Global.league_stats:
		var name_label = Label.new()
		name_label.set_text(league)
		statistics.add_child(name_label)
		
		var stats_label = Label.new()
		var wins:int = Global.league_stats[league]["win"]
		var played:int = Global.league_stats[league]["played"]
		stats_label.set_text("%d/%d"%[wins,played])
		statistics.add_child(stats_label)
		
func _on_Menu_pressed():
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

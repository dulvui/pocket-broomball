extends Control


func set_up():
	var temp = Global.matches
	
	if Global.final_teams.size() == 1:
		$Winner.text = Global.final_teams[0]["name"]
		$GridContainer.hide()
	else:
		for matchz in Global.matches:
			if matchz["result"] == ":":
				var home_short = Label.new()
				home_short.text = matchz["home"]["short_name"]
				$GridContainer.add_child(home_short)
				
				var vs_label = Label.new()
				vs_label.text = "vs"
				$GridContainer.add_child(vs_label)
				
				var away_short = Label.new()
				away_short.text = matchz["away"]["short_name"]
				$GridContainer.add_child(away_short)
				
	match Global.final_teams.size():
		4:
			$StageName.text = tr("SEMI FINALS")
		2:
			$StageName.text = tr("FINAL")
		1:
			$StageName.text = tr("WORLD CHAMPION")
			$WinnerIcon.texture = Global.final_teams[0]["icon"]



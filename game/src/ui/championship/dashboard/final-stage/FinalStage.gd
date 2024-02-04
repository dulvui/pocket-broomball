extends Control


func set_up():
	match Global.final_teams.size():
		4:
			$VBoxContainer/StageName.text = tr("SEMI FINALS")
			$VBoxContainer/VBoxContainer/Match3.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
		2:
			$VBoxContainer/StageName.text = tr("FINAL")
			$VBoxContainer/VBoxContainer/Match2.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
			$VBoxContainer/VBoxContainer/Match3.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
		1:
			$VBoxContainer/StageName.text = tr("WORLD CHAMPION")
			$VBoxContainer/Winner.text = Global.final_teams[0]["name"]
			$VBoxContainer/WinnerIcon.texture = Global.final_teams[0]["icon"]
			$VBoxContainer/VBoxContainer.hide()
		_:
			$VBoxContainer/StageName.text = tr("QUARTER FINALS")
	
	if Global.final_teams.size() > 1:
		var counter:int = 1
		for matchz in Global.matches:
			if matchz["result"] == ":":
				var match_box:HBoxContainer = get_node("VBoxContainer/VBoxContainer/Match" + str(counter))
				match_box.get_node("Home").text = matchz["home"]["short_name"].to_upper()
				match_box.get_node("HomeIcon").texture = matchz["home"]["icon"]
				
				match_box.get_node("Away").text = matchz["away"]["short_name"].to_upper()
				match_box.get_node("AwayIcon").texture = matchz["away"]["icon"]
				
				
				counter += 1


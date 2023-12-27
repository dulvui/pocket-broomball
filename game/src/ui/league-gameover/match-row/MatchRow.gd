extends HBoxContainer

func set_up(matchz) -> void:
	if matchz["home"].has("short_name"):
		$HomeTeam.text = matchz["home"]["short_name"] + " "
		$AwayTeam.text = " " + matchz["away"]["short_name"]
	
	$Score.text =  "  " +str(matchz["result"]) + "  "
	
	$HomeIcon.texture = matchz["home"]["icon"]
	$AwayIcon.texture = matchz["away"]["icon"]

extends Node2D

export var shoulder_color:Color
export var arm_color:Color
export var upper_arm_color:Color
export var computer:bool = false


func _ready():
	
	# color gets override if global team color is set
	$Body/LeftShoulder.self_modulate = Color(shoulder_color)
	$Body/RightShoulder.self_modulate = Color(shoulder_color)
	$Body/RightArm.self_modulate = Color(arm_color)
	$Body/LeftArm.self_modulate = Color(arm_color)
	$Body/LeftUpperArm.self_modulate = Color(upper_arm_color)
	$Body/RightUpperArm.self_modulate = Color(upper_arm_color)
	
	if computer:
		$Body/Stick.texture = ShopUtil.get_random_texture("STICK")
		$Body/Head.texture = ShopUtil.get_random_texture("HELMET")
	else:
		$Body/Stick.texture = ShopUtil.get_texture("STICK")
		$Body/Head.texture = ShopUtil.get_texture("HELMET")
	
	
	if get_parent().name == "Computer":
		if Global.away_team_icon != null:
			$Body/LeftShoulder/TeamLogo.texture = Global.away_team_icon
			$Body/RightShoulder/TeamLogo.texture = Global.away_team_icon
			
			$Body/LeftShoulder.self_modulate = Color(Global.away_team_colors[0])
			$Body/RightShoulder.self_modulate = Color(Global.away_team_colors[0])
			
			$Body/LeftUpperArm.self_modulate = Color(Global.away_team_colors[1])
			$Body/RightUpperArm.self_modulate = Color(Global.away_team_colors[1])
			
			$Body/RightArm.self_modulate = Color(Global.away_team_colors[1])
			$Body/LeftArm.self_modulate = Color(Global.away_team_colors[1])
			
			
	else:
		if Global.home_team_icon != null:
			$Body/LeftShoulder/TeamLogo.texture = Global.home_team_icon
			$Body/RightShoulder/TeamLogo.texture = Global.home_team_icon
			
			$Body/LeftShoulder.self_modulate = Color(Global.home_team_colors[0])
			$Body/RightShoulder.self_modulate = Color(Global.home_team_colors[0])
			
			$Body/LeftUpperArm.self_modulate = Color(Global.home_team_colors[1])
			$Body/RightUpperArm.self_modulate = Color(Global.home_team_colors[1])
			
			$Body/RightArm.self_modulate = Color(Global.home_team_colors[1])
			$Body/LeftArm.self_modulate = Color(Global.home_team_colors[1])
			
	
	$AnimationPlayer.play("Idle")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Shoot":
		$AnimationPlayer.play("Idle")

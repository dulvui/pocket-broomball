extends Control


func play(n):
	$Label.text  = "x" + str(n)
	$AnimationPlayer.play("Show")

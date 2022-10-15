extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Teams.load_teams()
	ShopUtil.load_assets()
	Global.set_up()
	$AnimationPlayer.play("FadeOut")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

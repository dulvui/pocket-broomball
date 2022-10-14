extends Node2D


export var singleplayer = true

func _ready():
	$Smoothing2D/Sprite.texture = ShopUtil.get_ball_texture()

extends Control

onready var animation_player = $AnimationPlayer

func _ready() -> void:
	$VBoxContainer/Buttons/Donate.visible = Global.FDROID or OS.get_name() == "HTML5"
	$VBoxContainer/Buttons/Website.visible = not $VBoxContainer/Buttons/Donate.visible
	
	animation_player.play("FadeIn")


func _on_Website_pressed() -> void:
	Global.click()
	OS.shell_open("https://simondalvai.org")


func _on_Github_pressed() -> void:
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball")


func _on_RichTextLabel_meta_clicked(meta) -> void:
	OS.shell_open(meta)
	Global.click()


func _on_Donate_pressed():
	Global.click()
	OS.shell_open("https://simondalvai.org/donate")
	

func _on_Join_pressed():
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball#join-with-your-broomball-team")
	

func _on_Back_pressed() -> void:
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")




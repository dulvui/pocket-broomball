extends Control


func _on_Website_pressed() -> void:
	Global.click()
	OS.shell_open("https://simondalvai.org")


func _on_Github_pressed() -> void:
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball")


func _on_RichTextLabel_meta_clicked(meta: String) -> void:
	OS.shell_open(meta)
	Global.click()


func _on_Join_pressed() -> void:
	Global.click()
	OS.shell_open("https://github.com/dulvui/pocket-broomball#join-with-your-broomball-team")
	

func _on_Back_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")




extends Control

signal next

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Continue_pressed():
	emit_signal("next")
	hide()

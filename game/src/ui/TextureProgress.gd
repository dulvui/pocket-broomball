extends TextureProgress


export(String, "POWER", "SPEED", "FREEZE") var text = "POWER"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = tr(text)

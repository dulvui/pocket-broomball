extends Label

func _ready():
	set_text(str(Global.coins))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str(Global.coins))

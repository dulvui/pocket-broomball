#helper for multiple audio stream playback
extends AudioStreamPlayer2D

func play( from_position=0.0 ):
	if !playing:
		.play(from_position)
	else:
		var asp = self.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(asp)
		asp.stream = stream
		asp.play()
		yield(asp, "finished")
		asp.queue_free()

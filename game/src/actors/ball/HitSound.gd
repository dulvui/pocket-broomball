#helper for multiple audio stream playback
extends AudioStreamPlayer2D


func hit(hit_speed:float):
	print(hit_speed)
	pitch_scale = rand_range(0.8, 1.2)
	volume_db = hit_speed / 1000.0
	if !playing:
		play()
	else:
		var asp = self.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(asp)
		asp.stream = stream
		asp.play()
		yield(asp, "finished")
		asp.queue_free()

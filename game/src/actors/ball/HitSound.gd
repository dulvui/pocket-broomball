# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

#helper for multiple audio stream playback
extends AudioStreamPlayer2D

const max_hits:int = 20
var hits:int = 0

func hit(hit_speed:float) -> void:
	pitch_scale = rand_range(0.8, 1.2)
	volume_db = hit_speed / 1000.0
	if !playing:
		play()
	elif hits < max_hits:
		hits += 1
		var audio_stream_player:AudioStreamPlayer2D = self.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(audio_stream_player)
		audio_stream_player.stream = stream
		audio_stream_player.play()
		yield(audio_stream_player, "finished")
		audio_stream_player.queue_free()
		hits -= 1

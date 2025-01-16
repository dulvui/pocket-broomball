# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends AudioStreamPlayer2D

const MAX_HITS: int = 4
var hits: int = 0
# delay between sounds
var delay: float = 0


func _process(delta: float) -> void:
	if delay > 0:
		delay -= delta
	else:
		delay = 0


func hit(hit_speed: float) -> void:
	pitch_scale = rand_range(0.8, 1.2)
	volume_db = hit_speed / 1500.0
	if !playing:
		play()
	elif hits < MAX_HITS and delay == 0:
		hits += 1
		delay = 0.1
		var audio_stream_player:AudioStreamPlayer2D = self.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(audio_stream_player)
		audio_stream_player.stream = stream
		audio_stream_player.play()
		yield(audio_stream_player, "finished")
		audio_stream_player.queue_free()
		hits -= 1

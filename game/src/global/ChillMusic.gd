# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends AudioStreamPlayer2D

var tween_out
var tween_in

export var transition_duration: float = 0.5
export var transition_type: int = 1 # TRANS_SINE

func _ready() -> void:
	tween_out = Tween.new()
	tween_in = Tween.new()
	add_child(tween_out)
	add_child(tween_in)

func fade_out() -> void:
	tween_out.interpolate_property(self, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()

func fade_in() -> void:
	tween_in.interpolate_property(self, "volume_db", -80, 0, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_in.start()

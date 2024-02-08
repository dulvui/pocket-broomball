# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

# This will track the position of every pointer in its public `state` property, which is a
# Dictionary, in which each key is a pointer id (integer) and each value its position (Vector2).
# It works by listening to input events not handled by other means.
# It also remaps the pointer indices coming from the OS to the lowest available to be friendlier.
# It can be conveniently setup as a singleton.

extends Node

var home_pressed = false
var away_pressed = false
var state = {}
var _os2own = {}

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			# Down
			if !_os2own.has(event.index): # Defensively discard index if already known
				if event.position.y > 640:
					if !home_pressed:
						home_pressed = true
						state["home"] = event.position - Vector2(0,80) #to make plazer above finger
						_os2own[event.index] = "home"
				elif !away_pressed:
					away_pressed = true
					state["away"] = event.position + Vector2(0,80)
					_os2own[event.index] = "away"
		else:
			# Up
			if _os2own.has(event.index): # Defensively discard index if not known
				var ptr_id = _os2own[event.index]
				state.erase(ptr_id)
				_os2own.erase(event.index)
				if ptr_id == "away":
					away_pressed = false
				else:
					home_pressed = false
		return true

	elif event is InputEventScreenDrag:
		# Move
		if _os2own.has(event.index): # Defensively discard index if not known
			var ptr_id = _os2own[event.index]
			if ptr_id == "home":
				state[ptr_id] = event.position - Vector2(0,80)
			else:
				state[ptr_id] = event.position + Vector2(0,80)
		return true

	return false

func reset():
	home_pressed = false
	away_pressed = false
	state = {}
	_os2own = {}

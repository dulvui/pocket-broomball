# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Label


var goals: int = 0
	
	
func goal() -> void:
	goals += 1
	set_text(str(goals))

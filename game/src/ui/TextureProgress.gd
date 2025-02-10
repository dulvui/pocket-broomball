# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends TextureProgress

export(String, "POWER", "SPEED", "FREEZE") var text: String = "POWER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = tr(text)

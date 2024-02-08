# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control


func set_up() -> void:
	$Group1/Group1.set_up_teams(Global.groups[0])
	$Group2/Group2.set_up_teams(Global.groups[1])
	$Group3/Group3.set_up_teams(Global.groups[2])
	$Group4/Group4.set_up_teams(Global.groups[3])

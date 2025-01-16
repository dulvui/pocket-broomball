# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

func _on_Menu_pressed() -> void:
	Global.click()
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Replay_pressed() -> void:
	Global.click()
	if Global.music:
		Global.music_loop.fade_out()
	get_tree().paused = false
	if get_parent().get_name() == "SinglePlayer":
		get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
	elif get_parent().get_name() == "Bots":
		get_tree().change_scene("res://src/ui/game/bots/Bots.tscn")
	else:
		get_tree().change_scene("res://src/ui/game/multiplayer/Multiplayer.tscn")

func single_player_winner(win: bool) -> void:
	if win:
		$VBoxContainer/Winner.text = tr("YOU_WIN")
	else:
		$VBoxContainer/Winner.text = tr("YOU_LOST")
		
func multiplayer_winner(home_win: bool) -> void:
	if home_win:
		$VBoxContainer/Winner.text = tr("PLAYER_1_WIN")
	else:
		$VBoxContainer/Winner.text = tr("PLAYER_2_WIN")
		
func bots_winner(home_win: bool) -> void:
	if home_win:
		$VBoxContainer/Winner.text = tr("BOT_1_WIN")
	else:
		$VBoxContainer/Winner.text = tr("BOT_2_WIN")

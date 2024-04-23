extends Node2D

func _ready():
	Global.loadGame()
	$ScoreCount.text = "Highscore: " + str(Global.bestscore)

func _on_begin_butt_butt_button_down():
	get_tree().change_scene_to_file("res://level.tscn")

func _on_quit_butt_butt_button_down():
	get_tree().quit()

extends Node

var dict = {}
var bestscore = 0
const SAVE_PATH = "res://savegame.bin"

func _ready():
	print(bestscore)
	var file = FileAccess.open("res://Data/english Dictionary.csv", FileAccess.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		dict[dict.size()] = data_set
	file.close()

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"bestscore": bestscore
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)

func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				bestscore = current_line["bestscore"]

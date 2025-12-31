extends Node

var music_volume := 1.0
var sfx_volume := 1.0

var password := "secret123"
var DATA = {}

func save_game() -> void:
	var path = "user://save.save"
	var save_data = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, password)
	if save_data:
		var json_string = JSON.stringify(DATA)
		save_data.store_line(json_string)
		save_data.close()

func load_game() -> void:
	var path = "user://save.save"
	if not FileAccess.file_exists(path):
		return

	var save_data = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, password)
	if not save_data:
		return

	while save_data.get_position() < save_data.get_length():
		var json_string = save_data.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			var node_data = json.get_data()
			DATA = node_data

	save_data.close()

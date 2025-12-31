extends Node

signal dialogue_ended

func costumize_show_dialogue(Dialogue : DialogueResource, title: String = "") -> void:
	GameState.input_enabled = false
	DialogueManager.show_dialogue_balloon(Dialogue,title)
	await DialogueManager.dialogue_ended
	emit_signal("dialogue_ended")
	GameState.input_enabled = true

extends Panel

@onready var bgm = $VBoxContainer/Music
@onready var sfx = $VBoxContainer/SFX

var bgm_bus_idx = AudioServer.get_bus_index("BGM")
var sfx_bus_idx = AudioServer.get_bus_index("SFX")


func pause() -> void:
	visible = not visible
	get_tree().paused = visible
	update_element()

func update_element() -> void:
	bgm.button_pressed = (not is_inf(AudioServer.get_bus_volume_db(bgm_bus_idx)))
	sfx.button_pressed = (not is_inf(AudioServer.get_bus_volume_db(sfx_bus_idx)))

func _on_bgm_toggled(toggled_on):
	if toggled_on:
		AudioServer.set_bus_volume_db(bgm_bus_idx, linear_to_db(1))
	else:
		AudioServer.set_bus_volume_db(bgm_bus_idx, linear_to_db(0))

func _on_sfx_toggled(toggled_on):
	if toggled_on:
		AudioServer.set_bus_volume_db(sfx_bus_idx, linear_to_db(1))
	else:
		AudioServer.set_bus_volume_db(sfx_bus_idx, linear_to_db(0))

extends Control

@onready var bgm = $Panel/CenterContainer/VBoxContainer/BGM
@onready var sfx = $Panel/CenterContainer/VBoxContainer/SFX

var bgm_bus_idx = AudioServer.get_bus_index("BGM")
var sfx_bus_idx = AudioServer.get_bus_index("SFX")

func _ready():
	bgm.button_pressed = (not is_inf(AudioServer.get_bus_volume_db(bgm_bus_idx)))
	sfx.button_pressed = (not is_inf(AudioServer.get_bus_volume_db(sfx_bus_idx)))

func _on_button_pressed():
	TransitionManager.change_scene(self,"res://UI/main_menu.tscn")


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

extends Control


@onready var confirmation_dialog : ConfirmationDialog = $ConfirmationDialog


func _ready():
	get_tree().set_auto_accept_quit(false)
	confirmation_dialog.confirmed.connect(quit_game)

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		confirmation_dialog.show()

func _on_play_pressed():
	TransitionManager.change_scene(self,"res://UI/second_scene.tscn")
	pass # Replace with function body.


func _on_setting_pressed():
	TransitionManager.change_scene(self, "res://UI/setting.tscn")

func _on_exit_pressed():
	confirmation_dialog.show()

func quit_game() -> void:
	get_tree().quit()

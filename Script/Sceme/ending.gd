extends Node2D

@onready var compassion = $Compassion
@onready var player = $Player
@onready var death_sfx = $DeathSFX

func _ready():
	if not NpcManager.hope_is_alive:
		$Hope.queue_free()
	if GlobalReferences.morality <= -20:
		GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/ending.dialogue"),"bad_ending")
	elif not NpcManager.hope_is_alive:
		GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/ending.dialogue"),"neutral_ending")
	else:
		GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/ending.dialogue"),"true_ending")

func bad_ending_scene(scene : int) -> void:
	match scene:
		1:
			TransitionManager.fade_in()
			await TransitionManager.animation_in_finished
			compassion.global_position = Vector2(296,112)
			player.play("dead_down")
			death_sfx.play()
			TransitionManager.fade_out()
			await TransitionManager.animation_out_finished
		2:
			await TransitionManager.text_animation_fade(["Without determination, without hope, humanity forgets how to feel."], 5)
			TransitionManager.change_scene(self, "res://UI/main_menu.tscn")

func neutral_ending_scene(scene : int) -> void:
	match scene:
		1:
			player.play("idle_side")
			player.flip_h = true
		2:
			await TransitionManager.text_animation_ratio(
				["The world survives. But without Hope, the light remains faint.,"
				,"The journey continues—in twilight."], 4)
			TransitionManager.change_scene(self, "res://UI/main_menu.tscn")

func true_ending_scene(scene : int) -> void:
	match scene:
		1:
			player.play("idle_side")
			player.flip_h = true
		2:
			await TransitionManager.text_animation_ratio(["With determination, compassion, and hope reunited,
the world begins to breathe again."], 5)
		3:
			TransitionManager.change_scene(self,"res://UI/main_menu.tscn")

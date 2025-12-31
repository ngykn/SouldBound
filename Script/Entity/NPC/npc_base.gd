class_name NPC extends CharacterBody2D
 
signal dialogue_ended

@export var dialogue_id : String
@export var dialogue_title : String
@onready var sprite = $Sprite2D

# ========================
# PUBLIC API
# ========================

func start_dialogue() -> void:
	if !dialogue_id:
		return

	GlobalFunction.costumize_show_dialogue(load(dialogue_id), dialogue_title)
	await GlobalFunction.dialogue_ended
	emit_signal("dialogue_ended")

func face_direction(direction : Vector2) -> void:
	_match_direciton(direction)


# ========================
# INTERNAL
# ========================

func _match_direciton(direction : Vector2) -> void:
	if abs(direction.x) > abs(direction.y):
		sprite.frame = 1
		sprite.flip_h = direction.x < 0
		print("side")
	else:
		if direction.y > 0:
			print("down")
			sprite.frame = 0
		else:
			print("up")
			sprite.frame = 2

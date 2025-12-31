class_name InteractionArea extends Area2D

signal npc_entered(npc : NPC)
signal npc_exited(npc : NPC)


func _ready():
	body_entered.connect(_npc_entered)
	body_exited.connect(_npc_exited)

func _npc_entered(body) -> void:
	if body.is_in_group("npc") and body is NPC:
		emit_signal("npc_entered",body)

func _npc_exited(body) -> void:
	if body.is_in_group("npc") and body is NPC:
		emit_signal("npc_exited",body)

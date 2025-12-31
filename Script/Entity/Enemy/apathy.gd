class_name Apathy extends CharacterBody2D

signal wave_finished(count : int)

@export var orb_scene : PackedScene
@export var attack_loop_count : int = 3
@export var attack_cooldown : int = 0
@onready var attack_timer = $AttackTimer

var state : String = "idle"
var vulnerable : bool = false

# =========================
# PUBLIC API
# =========================

func start_attack() -> void:
	_handle_attack()
# ========================
# INTERNAL
# ========================

func _handle_attack() -> void:
	var attack_count := 0
	for i in attack_loop_count:
		attack_count += 1
		await _spawn_orb()
		emit_signal("wave_finished", attack_count)
		await get_tree().create_timer(attack_cooldown).timeout

func _spawn_orb():
	var current_orb = orb_scene.instantiate()
	current_orb.global_position = global_position
	current_orb.apathy = self
	get_parent().add_child(current_orb)
	
	await current_orb.desolve

func _die() -> void:
	queue_free()

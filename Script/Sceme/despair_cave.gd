extends Scene


@onready var hope = $Hope
@onready var despair = $Despair
@onready var room_center = $RoomCenter

func _ready():
	super._ready()
	ui.inventory._update_inventory("Sword")
	ui.inventory._update_inventory("Dash Ring")
	camera.lock_at(room_center.global_position)
	despair.vulnerable.connect(despair_vulnerable)
	despair.dead.connect(despair_defeated)
	hope.dialogue_ended.connect(end)
	await TransitionManager.scene_transition_finished
	GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/despair.dialogue"),"pre_fight_despair")
	await GlobalFunction.dialogue_ended
	ui.main_objectives.add_objective("Defeat Despair")
	despair.active = true

func despair_defeated() -> void:
	GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/despair.dialogue"),"Hope")
	await GlobalFunction.dialogue_ended
	hope.queue_free()
	NpcManager.hope_is_alive = false
	end()

func despair_vulnerable() -> void:
	ui.main_objectives.completed_objective("Defeat Despair")
	hope.dialogue_id = preload("res://Dialogue/despair.dialogue")
	hope.dialogue_title = "spared_despair"
	GlobalFunction.costumize_show_dialogue(preload("res://Dialogue/despair.dialogue"),"despair_vulnerable")
	
func end() -> void:
	TransitionManager.change_scene(self,"res://Scene/ending.tscn")

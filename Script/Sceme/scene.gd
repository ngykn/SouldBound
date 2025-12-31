extends Scene

@onready var apathy := $Apathy

@onready var apathy_area : AreaCutscene = $CutScene/Apathy
@onready var strange_man_area : AreaCutscene = $CutScene/StrangeMan

var _have_met_strange_man := false
var _have_met_apathy := false

func _ready():
	strange_man_area.player_entered.connect(_strange_man_cutscene)
	apathy_area.player_entered.connect(_apathy_cutscene)
	camera.follow(player)

func _strange_man_cutscene() -> void:
	if _have_met_strange_man:
		return

	player.start_cutscene_move(Vector2(2744,632))
	await player.cutscene_movement_finished
	player._handle_interaction()
	_have_met_strange_man = true

func _apathy_cutscene() -> void:
	if _have_met_apathy:
		return
		
	player.start_cutscene_move(apathy_area.global_position)
	await player.cutscene_movement_finished
	camera.lock_at(apathy_area.global_position)

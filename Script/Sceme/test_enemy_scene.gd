extends Scene

func _ready():
	camera.follow(player)
	await get_tree().create_timer(1).timeout

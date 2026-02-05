extends PointLight2D

var orig_e : float

func _ready():
	orig_e = energy
	flicker()

func flicker():
	var tween = create_tween()
	
	tween.tween_property(self, "energy", orig_e * randf_range(0.8,1.2),0.3)
	tween.tween_property(self, "scale",Vector2.ONE * randf_range(0.95,1.05),0.3)
	tween.tween_callback(flicker)

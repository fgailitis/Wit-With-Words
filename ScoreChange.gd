extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0

func change_time(score, green):
	if green == true:
		modulate.r = -1
		text = "+" + str(score)
	else:
		modulate.r = 1
		text = "-" + str(score)
	modulate.a = 1
	while modulate.a > 0:
		modulate.a -= 0.05
		await get_tree().create_timer(0.25).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

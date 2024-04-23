extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_animation("A1")

func update_timer(time):
	if time > 99:
		time = 99
	elif time < 0 :
		time = 0
	$ClockTime.text = str(time)
	
func change_broken(degree):
	if degree < 1:
		degree = 1
	elif degree > 10:
		degree = 10
	set_animation("A" + str(degree))

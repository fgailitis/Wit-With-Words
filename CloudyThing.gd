extends ParallaxLayer

var speed = 3

func _process(delta):
	self.motion_offset.x += speed * delta
	self.motion_offset.y += speed * delta

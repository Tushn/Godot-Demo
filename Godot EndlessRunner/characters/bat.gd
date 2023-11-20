extends Node2D
var RotateSpeed = 2
var Radius = 20
var _centre
var _angle = 0

func _ready():
	set_process(true)
	#_centre = owner.position
	_centre = self.position

func _process(delta):
	get_node("Sprite2D/AnimationPlayer").play("fly")
	_angle += RotateSpeed * delta;
	var offset = Vector2(sin(_angle), cos(_angle)) * Radius;
	var pos = _centre + offset
	self.position = pos
		

	

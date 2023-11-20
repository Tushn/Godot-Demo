extends TextureRect

@export var vel = 0.1
var ini_width = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	position.x = position.x - vel
	#print('ok')
	#if position.x <= -largu

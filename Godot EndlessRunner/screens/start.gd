extends Control

var x_limits = 40
var x = 0
var direction = 0.1

var vel_tree = 0.3
var vel_tree_foreground = 0.9
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(x_limits < x or x < 0):
		direction *= -1
	x += direction
	get_node("Clouds").position.x += direction

	get_node("mountain-trees").position.x -= vel_tree
	get_node("mountain-trees2").position.x -= vel_tree
	if(get_node("mountain-trees").position.x<-577):
		get_node("mountain-trees").position.x = 1726
	if(get_node("mountain-trees2").position.x<-577):
		get_node("mountain-trees2").position.x = 1726

	get_node("mountain-foreground-trees").position.x -= vel_tree_foreground
	get_node("mountain-foreground-trees2").position.x -= vel_tree_foreground
	if(get_node("mountain-foreground-trees").position.x<-577):
		get_node("mountain-foreground-trees").position.x = 1726
	if(get_node("mountain-foreground-trees2").position.x<-577):
		get_node("mountain-foreground-trees2").position.x = 1726


func _on_start_button_down():
	get_tree().change_scene_to_file("res://scenes/lvl0.tscn")
	
func _on_exit_button_down():
	get_tree().quit()

extends CharacterBody2D

const SPEED = 120.0
const MAX_SPEED = 200.0
const ACCELERATION = 10
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var map
const states_anim = ["idle", "walk", "attack", "deading", "jump"]

func clearSprites():
	for i in range(len(states_anim)):
		get_node("manager/"+states_anim[i]).visible = false

func _ready():
	map = get_node("countryTileMap")
	# get_node("walk").visible = false
	clearSprites()
	get_node("manager/idle").visible = true
	get_node("manager/idle/AnimationPlayer").play("idle")
	set_physics_process(true)
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if(is_on_floor()):
			clearSprites()
			get_node("manager/walk").visible = true
			get_node("manager/idle/AnimationPlayer").play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if(is_on_floor()):
			clearSprites()
			get_node("manager/idle").visible = true
			get_node("manager/idle/AnimationPlayer").play("idle")

	if(not is_on_floor()):
		clearSprites()
		get_node("manager/jump").visible = true
		get_node("manager/idle/AnimationPlayer").play("jump")
	
	if(Input.is_action_pressed("ui_left")):
		get_node("manager/idle").set_flip_h(true)
		get_node("manager/walk").set_flip_h(true)
		get_node("manager/jump").set_flip_h(true)
	elif(Input.is_action_pressed("ui_right")):
		get_node("manager/idle").set_flip_h(false)
		get_node("manager/walk").set_flip_h(false)
		get_node("manager/jump").set_flip_h(false)	
	
	move_and_slide()

func _on_hurtbox_body_entered(body):
	print(body.name)
	#print()
	if(body.get_groups()[0] == "bat"):
		$hud/ProgressBar.value += 30
		if($hud/ProgressBar.value>=100):
			get_tree().change_scene_to_file("res://screens/gameover.tscn")
	if(body.get_groups()[0] == "ring"):
		$hud/ProgressBar.value = 0

extends Area2D

func _on_body_entered(body):
	if(body.name == "player"):
		#print(body.name)
		body.velocity.y = body.JUMP_VELOCITY#100# body.JUMP_FORCE
		owner.queue_free()
	#pass # Replace with function body.

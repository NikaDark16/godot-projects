extends Area2D

func _on_Mushroom_body_entered(body):
	if body.name == "Player":
		self.queue_free()

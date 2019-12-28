extends Node2D

var mouse_entered = false

signal click(node)

func set_number(number: int):
	$Label.text = str(number)
	
func get_number():
	return int($Label.text)

func _on_Vertex_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.pressed:
			emit_signal("click", self)

extends Node2D

var mushrooms_count = 0
var mushrooms_count_label 

func _ready():
	mushrooms_count_label = get_node("CanvasLayer/MarginContainer/HBoxContainer/Label")
	update_labels()

func add_moshroom():
	mushrooms_count += 1
	update_labels()
	
func update_labels():
	mushrooms_count_label.text = "%d/8" % mushrooms_count

func _on_Mushroom_body_entered(body: PhysicsBody2D):
	if body:
		if body.name == "Player":
			add_moshroom()
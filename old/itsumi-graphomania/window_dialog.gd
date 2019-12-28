extends WindowDialog

var graph
var vertices

func _ready():
	graph = get_node("../Graph")
	vertices = graph.vertices
	

func update_option_button():
	$VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonStart.clear()
	$VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonEnd.clear()
	for vertex in vertices:
		$VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonStart.add_item(str(vertex.get_number()))
		$VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonEnd.add_item(str(vertex.get_number()))

func _on_ButtonOk_pressed():
	var start_edge = vertices[int($VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonStart.get_item_text())]
	var end_edge = vertices[int($VBoxContainer/HBoxContainer2/VBoxContainer2/OptionButtonEnd.get_item_text())]
	graph.add_edge(start_edge, end_edge)


func _on_ButtonCancel_pressed():
	self.hide()

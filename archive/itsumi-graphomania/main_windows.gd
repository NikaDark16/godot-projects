extends Node2D

var graph

func _ready():
	graph = get_node("UGraph")

func _on_ButtonSwitch_pressed():
	if graph == get_node("UGraph"):
		$UGraph.visible = false
		graph = $OGraph
		$VBoxContainer/HBoxContainerPanel/ButtonSwitch.text = "Ориентированный граф"
		$OGraph.visible = true
	else:
		$OGraph.visible = false
		graph = $UGraph
		$VBoxContainer/HBoxContainerPanel/ButtonSwitch.text = "Неориентированный граф"
		$UGraph.visible = true

func is_oriented():
	return graph == get_node("OGraph")
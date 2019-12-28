extends MenuButton

var popup

var graph

func _ready():
	popup = get_popup()
	popup.add_font_override("font", load("res://gui.tres"))
	popup.add_item("Создать граф")
	popup.add_separator()
	popup.add_item("Матрица смежности")
	popup.add_item("Матрица инцидентности")
	popup.add_separator()
	popup.add_item("Удалить всё")
	popup.connect("index_pressed", self, "_make_somethings", [])
	
	
func _process(delta):
	graph = get_node("../../..").graph
	

func _make_somethings(index):
	if (index == 0):
		graph.clear_all()
	if (index == 2):
		print(graph)
		var matrix = Global.to_matrix(graph.vertices, graph.edges, get_node("../../..").is_oriented())
		var text_matrix = ""
		for string in matrix:
			for element in string:
				text_matrix += str(element) + ", "
			text_matrix += "\n"
		get_node("../../../WindowDialogAdjacencyMatrix").show()
		get_node("../../../WindowDialogAdjacencyMatrix/VBoxContainer/TextEdit").text = text_matrix
	if (index == 3):
		var matrix = []
		for vertex in graph.vertices:
			var string = []
			string.resize(len(graph.edges))
			for i in range(len(string)):
				if string[i] == null:
					string[i] = 0
			matrix.push_back(string)
		for i in range(len(graph.edges)):
			matrix[graph.edges[i].end.get_number()][i] = -1
			if get_node("../../..").is_oriented():
				matrix[graph.edges[i].end.get_number()][i] = -1
			matrix[graph.edges[i].start.get_number()][i] = 1
			

		print(matrix)
		var text_matrix = ""
		for string in matrix:
			for element in string:
				text_matrix += str(element) + ", "
			text_matrix += "\n"
		get_node("../../../WindowDialogIncidenceMatrix").show()
		get_node("../../../WindowDialogIncidenceMatrix/VBoxContainer/TextEdit").text = text_matrix
	if (index == 5):
		graph.clear_all()
	
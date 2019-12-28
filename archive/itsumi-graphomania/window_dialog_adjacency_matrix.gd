extends WindowDialog

var graph

func _process(delta):
	graph = get_node("..").graph

func _on_ButtonSave_pressed():
	var matrix = []
	var text_matrix = $VBoxContainer/TextEdit.text
	for string in text_matrix.split("\n"):
		var int_string = []
		for element in string.split(",", false):
			if (element.replace(" ", "") != "" and element.replace(" ", "").is_valid_integer()):
				int_string.push_back(int(element))
		if len(int_string) > 0:
			matrix.push_back(int_string)
	var max_int = 0
	for string in matrix:
		max_int = int(max(len(string), max_int))
	for string in matrix:
		string.resize(max_int)
		for i in range(len(string)):
			if string[i] == null:
				string[i] = 0
			if string[i] != 0:
				string[i] = 1
	if (len(matrix) > 0 and len(matrix) == len(matrix[0])):
		for vertex in graph.vertices:
			graph.delete_edge_auto(vertex)
		if len(graph.vertices) <  len(matrix):
			var vertices_count = len(matrix) - len(graph.vertices)
			for i in range(vertices_count):
				graph.add_vertex()
		if len(graph.vertices) >  len(matrix):
			var vertices_count = len(graph.vertices) - len(matrix) 
			for i in range(vertices_count):
				graph.delete_vertex(graph.vertices[-1])
		for vertex in graph.vertices:
			for i in range(len(matrix[vertex.get_number()])):
				if matrix[vertex.get_number()][i] == 1:
					graph.add_edge(vertex, graph.vertices[i])
		print(graph.edges)
	elif len(matrix) == 0:
		graph.clear_all()

func _on_ButtonCancel_pressed():
	hide()

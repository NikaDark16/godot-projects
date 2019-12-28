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
				string[i] = string[i] / abs(string[i])
	if len(matrix) > 0:
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
		for j in range(len(matrix[0])):
			if not get_node("..").is_oriented():
				var type = 0
				var start = null
				var end = null
				for i in range(len(matrix)):
					if (matrix[i][j] == 1):
						type += 1
						if type == 1:
							start = graph.vertices[i]
						if type == 2:
							end = graph.vertices[i]
				if type == 0:
					continue
				if type == 1:
					graph.add_edge(start, start)
				if type == 2:
					graph.add_edge(start, end)
			else:
				var start = null
				var end = null
				for i in range(len(matrix)):
					if (matrix[i][j] == -1):
						end = graph.vertices[i]
					if (matrix[i][j] == 1):
						start = graph.vertices[i]
				if start == null and end == null:
					continue
				if start != null and end == null:
					graph.add_edge(start, start)
				elif start == null and end != null:
					continue
				else:
					graph.add_edge(start, end)
				print(start,end)
	elif len(matrix) == 0:
		graph.clear_all()

func _on_ButtonCancel_pressed():
	hide()
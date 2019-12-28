extends MenuButton

var popup
var graph

var true_path = []

func _ready():
	popup = get_popup()
	popup.add_font_override("font", load("res://gui.tres"))
	popup.add_item("Эйлеров ли граф?")
	popup.add_item("Гамильтонов ли граф?")
	popup.connect("index_pressed", self, "_make_somethings", [])
	
func _process(delta):
	graph = get_node("../../..").graph
	
func _make_somethings(index):
	if not get_node("../../..").is_oriented():
		var matrix = Global.to_matrix(graph.vertices, graph.edges)
		if (index == 0):
			var is_eulerian_graph = true
			for i in range(len(matrix)):
				if matrix[i][i] != 0:
					is_eulerian_graph = false
				var vertex_degree = 0
				for j in range(len(matrix)):
					vertex_degree += matrix[i][j]
				if vertex_degree % 2 != 0 or vertex_degree == 0:
					is_eulerian_graph = false
			if is_eulerian_graph and matrix:
				get_node("../../../AcceptDialog").get_label().text = "Граф Эйлеров"
			else:
				get_node("../../../AcceptDialog").get_label().text = "Граф не Эйлеров"
			get_node("../../../AcceptDialog").show()
		if (index == 1):
			var is_hamiltonian_graph = true
			for i in range(len(matrix)):
				for j in range(len(matrix)):
					if matrix[i][i] != 0:
						is_hamiltonian_graph = false
			true_path.clear()
			find_hamiltonian_cycle(matrix)
			if len(true_path) > 0 and is_hamiltonian_graph:
				get_node("../../../AcceptDialog").get_label().text = "Граф Гамильтонов "
			else:
				get_node("../../../AcceptDialog").get_label().text = "Граф не Гамильтонов"
			get_node("../../../AcceptDialog").show()
	else:
		get_node("../../../AcceptDialog").get_label().text = "Не работает с ориентированными графами"
		get_node("../../../AcceptDialog").show()
		
func find_hamiltonian_cycle(_matrix, _path = [0]):
	var matrix = _matrix
	var path = [] + _path
	for i in range(len(matrix)):
		if matrix[_path[-1]][i] == 1 and not(i in _path):
				find_hamiltonian_cycle(matrix, path + [i])
		elif len(path) == len(matrix):
			if matrix[_path[-1]][path[0]] == 1:
				if not(path in true_path):
					true_path.push_back(path)
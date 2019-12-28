extends Node

const MODE = {
	DEFAULT = 0,
	ADD_VERTEX = 1,
	ADD_EDGE = 2,
	DELETE = 3
}

func to_matrix(vertices, edges, is_oriented = false):
	var matrix = []
	for vertex in vertices:
		var row = []
		row.resize(len(vertices))
		for edge in edges:
			if edge.start == vertex:
				row[edge.end.get_number()] = 1
			if edge.end == vertex and not is_oriented:
				row[edge.start.get_number()] = 1
		for i in range(len(row)):
			if row[i] == null:
				row[i] = 0
		matrix.push_back(row)
	return matrix

var current_mode = MODE.DEFAULT


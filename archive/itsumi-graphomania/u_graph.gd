extends Node2D

const SCREEN_SIZE = Vector2(1280, 720)
const VERTEX_SIZE = Vector2(32, 32)
const PANEL_SIZE = Vector2(1280, 43)

var rng = RandomNumberGenerator.new()

var vertex = load("res://vertex.tscn")
var vertices = []
var edge = preload("res://edges.tscn")
var edges = []
var select = false
var first
var second

func _ready():
	rng.randomize()

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if event.position.x > VERTEX_SIZE.x / 2 and event.position.x < SCREEN_SIZE.x - VERTEX_SIZE.x / 2:
				if event.position.y >  PANEL_SIZE.y + VERTEX_SIZE.y / 2 and event.position.y < SCREEN_SIZE.y - VERTEX_SIZE.y / 2:
					if (Global.current_mode == Global.MODE.ADD_VERTEX):
						add_vertex(event.position)

func add_vertex(position = Vector2.ZERO):
	if visible == true:
		var temp_vertex = vertex.instance()
		if position != Vector2.ZERO:
			temp_vertex.position = position
		else:
			var temp_x = rng.randi_range(VERTEX_SIZE.x / 2, SCREEN_SIZE.x - VERTEX_SIZE.x / 2)
			var temp_y = rng.randi_range(PANEL_SIZE.y + VERTEX_SIZE.y / 2, SCREEN_SIZE.y - VERTEX_SIZE.y / 2)
			temp_vertex.position = Vector2(temp_x, temp_y)
		temp_vertex.set_number(len(vertices))
		temp_vertex.connect("click", self, "_get_vertex_by_click")
		vertices.append(temp_vertex)
		add_child(temp_vertex)
	
func delete_vertex(vertex):
	delete_edge_auto(vertex)
	vertices.remove(vertex.get_number())
	fix_indexes()
	vertex.queue_free()
	
func add_edge(start_vertex, end_vertex):
	for edge in edges:
		if edge.start == start_vertex and edge.end == end_vertex or edge.start == end_vertex and edge.end == start_vertex:
			return
	var temp_edge = edge.instance()
	temp_edge.init(start_vertex, end_vertex)
	edges.append(temp_edge)
	add_child(temp_edge)
	
func delete_edge_auto(vertex):
	var i = 0
	while i < len(edges):
		var edge = edges[i]
		if edge.start == vertex or edge.end == vertex:
			edges.remove(edges.find(edge))
			edge.queue_free()
		else:
			i += 1
	
func fix_indexes():
	var number = 0
	for vertex in vertices:
		vertex.set_number(number)
		number += 1
		
func clear_all():
	var i = 0
	while i < len(vertices):
		var vertex = vertices[i]
		delete_edge_auto(vertex)
		vertices.remove(vertex.get_number())
		fix_indexes()
		vertex.queue_free()
	vertices = []
	
func _get_vertex_by_click(vertex):
	if (Global.current_mode == Global.MODE.DELETE):
		delete_vertex(vertex)
	if (Global.current_mode == Global.MODE.ADD_EDGE):
		if not select:
			first = vertex
			select = true;
		else:
			second = vertex
			add_edge(first, second)
			select = false;
	
func _on_ButtonAddEdge_pressed():
	var window_dialog = get_node("../WindowDialog")
	window_dialog.update_option_button()
	window_dialog.show()
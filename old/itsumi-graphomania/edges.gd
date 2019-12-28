extends Node2D

var start
var end
var oriented

func init(start, end, oriented = false):
	self.start = start
	self.end = end
	self.oriented = oriented
	

func _draw():
	if (start != end):
		var vector = Vector2(end.position.x - start.position.x, end.position.y - start.position.y)
		vector = vector.normalized()
		while vector.length() < 15:
			vector += vector.normalized()
		draw_line(start.position+vector, end.position-vector, Color(199, 183, 199), 3, false)
		if oriented:
			$Arrow.position = end.position-vector*1.5
			$Arrow.look_at(end.position + vector)
			$Arrow.visible = true
	else:
		position = start.position
		$Loop.visible = true
		$Arrow.visible = false
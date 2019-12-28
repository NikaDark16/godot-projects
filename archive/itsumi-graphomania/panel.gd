extends HBoxContainer

func _ready():
	$ButtonDefault.pressed = true;
	set_mode(Global.MODE.DEFAULT)

func set_mode(mode):
	Global.current_mode = mode
	if mode != Global.MODE.DEFAULT:
		$ButtonDefault.pressed = false;
	if mode != Global.MODE.ADD_VERTEX:
		$ButtonAddVertex.pressed = false;
	if mode != Global.MODE.ADD_EDGE:
		$ButtonAddEdge.pressed = false;
	if mode != Global.MODE.DELETE:
		$ButtonDelete.pressed = false;


func _on_ButtonDefault_toggled(button_pressed):
	if button_pressed:
		set_mode(Global.MODE.DEFAULT)
	else:
		$ButtonDefault.pressed = true;
		set_mode(Global.MODE.DEFAULT)


func _on_ButtonAddVertex_toggled(button_pressed):
	if button_pressed:
		set_mode(Global.MODE.ADD_VERTEX)
	else:
		$ButtonDefault.pressed = true;
		set_mode(Global.MODE.DEFAULT)


func _on_ButtonDelete_toggled(button_pressed):
	if button_pressed:
		set_mode(Global.MODE.DELETE)
	else:
		$ButtonDefault.pressed = true;
		set_mode(Global.MODE.DEFAULT)


func _on_ButtonAddEdge_toggled(button_pressed):
	if button_pressed:
		set_mode(Global.MODE.ADD_EDGE)
	else:
		$ButtonDefault.pressed = true;
		set_mode(Global.MODE.DEFAULT)

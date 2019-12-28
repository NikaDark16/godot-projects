extends Sprite

var x
var y
var game
var map
var gui

func _move(move_x, move_y):
	if game.step != 0:
		if x + move_x < 6 and x + move_x >= 0 and game.step == 1:
			x += move_x
		if y + move_y < 6 and y + move_y >= 0 and game.step == 2:
			y += move_y
		position = Vector2((120*x)+280+60, (120*y)+60)

func _select(select_step):
	if game.step == select_step and map.map[y][x] != 0:
		var score = map.map[y][x]
		if map._delete_cell(x, y):
			game._set_score(game.step, score)
			game._change_step()
			if !map._check_step(game.step, x, y):
				game._end_game()
				gui._show_end(_get_winner())
			
func _get_winner():
	if game.score_p1 > game.score_p2:
		return 1
	if game.score_p1 < game.score_p2:
		return 2
	else:
		return 0

func _ready():
	# Initialization
	x = 3
	y = 3
	game = get_node("..")
	map = get_node("../Map")
	gui = get_node("../GUI")
	
func _process(delta):
	# Player 1
	if Input.is_action_just_released("ui_left"):
		_move(-1, 0)
	if Input.is_action_just_released("ui_right"):
		_move(1, 0)
	if Input.is_action_just_released("ui_accept_p1"):
		_select(1)

	# Player 2
	if Input.is_action_just_released("ui_up"):
		_move(0, -1)
	if Input.is_action_just_released("ui_down"):
		_move(0, 1)
	if Input.is_action_just_released("ui_accept_p2"):
		_select(2)
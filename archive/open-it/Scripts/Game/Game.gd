extends Node

var score_p1
var score_p2
var step # 1 = p1, 2 = p2, 0 = end of game
var gui

func _change_step():
	if step == 1:
		step = 2
	else:
		step = 1

func _end_game():
	step = 0
	

func _set_score(player, score):
	if player == 1:
		score_p1 += score
	else:
		score_p2 += score
	gui._set_score(score_p1, score_p2)

func _ready():
	score_p1 = 0
	score_p2 = 0
	step = 1
	gui = get_node("GUI")
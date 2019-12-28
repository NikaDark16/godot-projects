extends Control

var button_back
var label_score_p1
var label_score_p2
var dialog_end_game
var button_dialog_end_game_ok
var lable_dialog_end_game_text

func _ready():
	# Initialization buttons
	button_back = get_node("Back")
	label_score_p1 = get_node("ScoreP1")
	label_score_p2 = get_node("ScoreP2")
	dialog_end_game = get_node("EndGame")
	lable_dialog_end_game_text = get_node("EndGame/MarginContainer/VBoxContainer/Label")
	button_dialog_end_game_ok = get_node("EndGame/MarginContainer/VBoxContainer/Button")

	# Connections
	button_back.connect("button_up", self, "press_button_back")
	button_dialog_end_game_ok.connect("button_up", self, "press_button_back")

	# Disabling

func _set_score(p1, p2):
	label_score_p1.text = "Score: " + str(p1)
	label_score_p2.text = "Score: " + str(p2)

func _show_end(player):
	if player != 0:
		lable_dialog_end_game_text.text = "Player " + str(player) + " won!"
	else:
		lable_dialog_end_game_text.text = "Draw"
	dialog_end_game.show()

# Press button

func press_button_back():
	get_tree().change_scene("res://Scenes/Menu.tscn")
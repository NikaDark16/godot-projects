extends VBoxContainer

var button_start
var button_mode
var button_difficulty
var button_back

var menu_main
var menu_start

func _ready():
	# Initialization buttons
	button_start = get_node("Start")
	button_mode = get_node("Mode")
	button_difficulty = get_node("Difficulty")
	button_back = get_node("Back")

	# Initialization menues
	menu_main = get_node("../Main")
	menu_start = self

	# Connections
	button_start.connect("button_up", self, "press_button_start")
	button_mode.connect("button_up", self, "press_button_mode")
	button_difficulty.connect("button_up", self, "press_button_difficulty")
	button_back.connect("button_up", self, "press_button_back")

	# Disabling
	button_mode.disabled = true
	button_difficulty.disabled = true

# Press button
func press_button_start():
	get_tree().change_scene("res://Scenes/Game.tscn")

func press_button_mode():
	pass

func press_button_difficulty():
	pass

func press_button_back():
	menu_main.visible = true
	menu_start.visible = false
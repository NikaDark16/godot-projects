extends VBoxContainer

var button_start
var button_config
var button_extra
var button_exit

var menu_main
var menu_start

func _ready():
	# Initialization
	button_start = get_node("GameStart")
	button_config = get_node("Config")
	button_extra = get_node("Extra")
	button_exit = get_node("Exit")

	# Initialization menues
	menu_main = self
	menu_start = get_node("../Start")

	# Connections
	button_start.connect("button_up", self, "press_button_start")
	button_config.connect("button_up", self, "press_button_config")
	button_extra.connect("button_up", self, "press_button_extra")
	button_exit.connect("button_up", self, "press_button_exit")

	# Disabling
	button_config.disabled = true
	button_extra.disabled = true

# Press button
func press_button_start():
	menu_main.visible = false
	menu_start.visible = true

func press_button_config():
	pass

func press_button_extra():
	pass

func press_button_exit():
	get_tree().quit()
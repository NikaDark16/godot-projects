extends Node2D

var labelHumans = null
var labelMagicians = null
var labelDemos = null
var labelMagic = null
var labelWin = null
var gui = null
var win = null

var humans = 0
var magicians = 1
var demons = 0
var magic = 0

func _ready():
	
	
	labelHumans = get_node("GUI/HBoxContainer/LabelHumans")
	labelMagicians = get_node("GUI/HBoxContainer/LabelMagicians")
	labelDemos = get_node("GUI/HBoxContainer/LabelDemons")
	labelMagic = get_node("GUI/LabelMagic")
	labelWin = get_node("Win/LabelWin")
	gui = get_node("GUI")
	win  = get_node("Win")
	update()

func _on_FindHumans_pressed():
	humans += magicians * 2
	update()

func _on_MakeMagic_pressed():
	magic += magicians;
	update()

func _on_TurnIntoMagicians_pressed():
	if humans > 0 and magic > 0:
		if humans > magic:
			magicians += magic
			humans -= magic
			magic = 0
		elif humans < magic:
			magicians += humans
			magic -= humans
			humans = 0
		elif humans == magic:
			magicians += humans
			humans = 0
			magic = 0
	update()

func _on_SummonADemon_pressed():
	var victims
	if magicians % 2 == 1:
		victims = magicians - 1
	else:
		victims = magicians - 2
		 
	if victims / 2 > 0 and magic > 0:
		if victims / 2 > magic:
			demons += magic
			magicians -= magic * 2
			magic = 0
		elif victims / 2 < magic:
			demons += victims / 2
			magicians -= victims
			magic = victims * 2
		elif victims / 2 == magic:
			demons += victims / 2
			magicians -= victims
			magic = victims * 2
	update()

func _on_ButtonTakeOverTheWorld_pressed():
	if demons >= 100:
    	gui.set_visible(false)
    	win.set_visible(true)
    	labelWin.text = "You win, with %s demons" % demons

func _on_ButtonRestart_pressed():
	humans = 0;
	magicians = 1;
	demons = 0;
	magic = 0;
	gui.set_visible(true);
	win.set_visible(false);
	update()

func update():
	labelHumans.text = "Humans: %d," % humans
	labelMagicians.text = "Magicians: %d," % magicians 
	labelDemos.text = "Demons: %d," % demons
	labelMagic.text = "Magic: %d." % magic

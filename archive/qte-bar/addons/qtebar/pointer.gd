extends Sprite

export var speed = 100

var bar_size = Vector2.ZERO
var pointer_size = Vector2.ZERO
var max_pointer_x

func _ready():
	bar_size = get_node("../Bar").texture.get_size()
	pointer_size = texture.get_size()
	max_pointer_x = bar_size.x / 2 - pointer_size.x / 2

func _process(delta):
	if abs(position.x) > max_pointer_x:
		speed *= -1
	position.x += speed*delta
	
	if Input.is_action_just_released("ui_accept"):
		var result = (max_pointer_x - abs(position.x)) / max_pointer_x * 100
		print(result)
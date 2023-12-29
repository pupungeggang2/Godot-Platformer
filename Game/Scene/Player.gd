extends Node2D

@export var speed = 160.0
@export var speed_dash = 320.0

var pressed = {
	'left' : false,
	'right' : false,
	'up' : false,
	'down' : false,
	'dash' : false
}

func _ready():
	position = Vector2(20, 700)

func _process(delta):
	input_handle()
	player_move(delta)

func input_handle():
	for direction in pressed:
		if Input.is_action_just_pressed(direction):
			pressed[direction] = true
			
		if Input.is_action_just_released(direction):
			pressed[direction] = false
	
func player_move(delta):
	var temp_position = Vector2(position.x, position.y)
	
	if pressed['left'] == true:
		if pressed['dash'] == true:
			temp_position.x += -speed_dash * delta
		else:
			temp_position.x += -speed * delta
		
	if pressed['right'] == true:
		if pressed['dash'] == true:
			temp_position.x += speed_dash * delta
		else:
			temp_position.x += speed * delta
		
	position = Vector2(temp_position.x, temp_position.y)

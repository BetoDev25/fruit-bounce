extends CharacterBody2D

var left_limit = 390
var right_limit = 1150
var original_y = 625
var shift_amount = 40
var shift_speed = 100

func _physics_process(_delta):
	var mouse_x = get_global_mouse_position().x
	position.x = clamp(mouse_x, left_limit, right_limit)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position.y = move_toward(position.y, original_y - shift_amount, shift_speed * _delta)
	else:
		position.y = move_toward(position.y, original_y, shift_speed * _delta)
	
	velocity = Vector2.ZERO
	move_and_slide()

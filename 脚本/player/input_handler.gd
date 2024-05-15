extends Node

@onready var jump_buffer_timer: Timer = $JumpBufferTimer

var x = 0
var jump_just_pressed = false:
	get:
		return jump_just_pressed
	set(v):
		jump_just_pressed = v
		if v: jump_buffer = true
var jump_buffer:
	get:
		return jump_buffer_timer.time_left > 0
	set(v):
		if v: jump_buffer_timer.start()
		else:
			jump_buffer_timer.stop()                   
#以上 当按键刚按下时，启动缓冲计时。
var jump_pressed = false



func update(): # 每帧调用来获取输入的函数
	x = Input.get_axis("move_left" , "move_right")
	jump_just_pressed = Input.is_action_just_pressed("jump")
	jump_pressed = Input.is_action_pressed("jump")

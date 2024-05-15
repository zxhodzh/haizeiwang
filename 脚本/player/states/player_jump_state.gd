extends PlayerBaseState

var var_jump_high
@onready var jump_sfx: AudioStreamPlayer = $jumpSFX


func enter():
	play("jump")
	object.velocity.y = Player.MAXJUMP_VELOCITY
	object.velocity.x += input.x * Player.MAX_SPEED # 跳起来时 横向速度更快
	var_jump_high = false
	input.jump_buffer = false
	jump_sfx.play()
	
func physics_update(delta):
	move(delta , true)
	# 检查var_jump_high变量是否为假,如果var_jump_high是假，那么not var_jump_high就为真。
	# 这里not var_jump_high 代替了 var_jump_high = false
	if not var_jump_high and not input.jump_pressed:
		var_jump_high = true
		if object.velocity.y <= 0:
			object.velocity.y /= 2
	if object.velocity.y >= 0:
		chang_state("fall")

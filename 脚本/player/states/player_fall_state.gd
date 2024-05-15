extends PlayerBaseState


@onready var coyote_timer: Timer = $CoyoteTimer
@onready var landing_sfx: AudioStreamPlayer = $LandingSFX

func enter():
	play("fall")
	if fsm.previous_state != "jump": # 上一个状态不是JUMP才启动郊狼
		coyote_timer.start()

func physics_update(delta):
	move(delta , true)
	if coyote_timer.time_left > 0 and input.jump_just_pressed:
		chang_state("jump")
	elif object.is_on_floor():
		if input.jump_buffer:  # 到达地面前N秒内 输入跳跃了，就进入跳跃状态。
			chang_state("jump")
		else:
			chang_state("idle" if input.x == 0 else "run")
			landing_sfx.play()

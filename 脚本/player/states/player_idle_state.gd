extends PlayerBaseState

func enter():
	play("idle")

func physics_update(delta):
	move(delta , false)
	
	if input.jump_just_pressed:
		chang_state("jump")
	elif not object.is_on_floor():
		chang_state("fall")
	elif input.x != 0:
		chang_state("run")

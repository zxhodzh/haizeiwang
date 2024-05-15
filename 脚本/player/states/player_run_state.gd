extends PlayerBaseState

@onready var footsteps_sfx: AudioStreamPlayer = $FootstepsSFX


func enter():
	play("run")
	footsteps_sfx.play()
	
	
func physics_update(delta):
	move(delta , false)
	
	if input.jump_just_pressed:
		chang_state("jump")
	elif not object.is_on_floor():
		chang_state("fall")
	elif input.x == 0:
		chang_state("idle")

func exit():
	footsteps_sfx.stop()
	


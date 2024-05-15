extends State
class_name PlayerBaseState

var input:
	get:return object.input_handler

func play(animation):
	if object.sword and object.animated_sprite.sprite_frames.has_animation(animation + "_sword"):
		animation += "_sword"
	object.animated_sprite.play(animation)
	
func accelerate(delta , direction = input.x):
	var acceleration = Player.AIR_ACCELERATION if not object.is_on_floor() else Player.FLOOR_ACCELERATION
	object.velocity.x = move_toward(object.velocity.x , Player.MAX_SPEED * direction , acceleration * delta)
	
func apply_gravity(delta):
	var g = Player.JUMP_GRAVITY if fsm.current_state == "jump" else Player.FALL_GRAVITY
	object.velocity.y = move_toward(object.velocity.y , Player.MAXFALL_VELOCITY, g * delta)

func move(delta , apply_g , update_direction = true , direction = input.x):
	accelerate(delta , direction)
	if apply_g:
		apply_gravity(delta)
	if update_direction:
		object.direction = direction
	object.move_and_slide()
	

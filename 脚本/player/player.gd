extends CharacterBody2D
class_name Player


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fsm: FSM = $FSM
@onready var input_handler: Node = $InputHandler



const MAXJUMP_VELOCITY = -350.0
const MAX_SPEED = 190.0
const FLOOR_ACCELERATION = 900.0
const AIR_ACCELERATION = 1900.0
const JUMP_GRAVITY = 900.0
const FALL_GRAVITY = 900.0
const MAXFALL_VELOCITY = 1900.0

var sword = false:
	get: return sword
	set(v):
		if sword == v: return
		sword = v
		var current_anim = animated_sprite.animation
		var target_anim = current_anim
		if v:
			target_anim += "_sword"
		else:
			target_anim = target_anim.replace("_sword" , "")
		if animated_sprite.sprite_frames.has_animation(target_anim):
			var frame = animated_sprite.frame
			var progress = animated_sprite.frame_progress
			
			animated_sprite.play(target_anim)
			animated_sprite.set_frame_and_progress(frame , progress)
			
var direction:
	get: return direction
	set(v):
		if v == 0 or v == direction: return 
		direction = v
		animated_sprite.flip_h = v == -1

func _ready() -> void:
	fsm.chang_state("idle")  # 先定义开局状态为状态机的 idle 状态
	
func _physics_process(delta: float) -> void:
	input_handler.update()
	fsm.physics_update(delta)  # 定义物理更新为状态机的 物理更新（关联会再次跳转为当前状态节点的物理更新）
	
	

	

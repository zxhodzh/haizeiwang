extends Node
class_name State
#@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var object #指向这个状态控制的对象
var fsm    #状态间转换时使用


func enter(): #每次进入状态时都会执行
	pass
	
func update(_delta):
	pass
	
func physics_update(_delta):
	pass

func exit(): #每次离开状态时都会执行
	pass
	
func chang_state(next_state):  #接受下一个状态
	fsm.chang_state(next_state) # 调用fsm来改变状态

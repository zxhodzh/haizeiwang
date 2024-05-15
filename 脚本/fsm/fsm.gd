extends Node
class_name FSM

var states = {}
var current_state #当前状态的引用
var current_state_node #当前状态节点（当前激活的节点）
var previous_state #表示前一个状态

func _ready() -> void:
	var object = get_parent() #表示持有状态机节点的父节点
	for child in get_children(): # 便历子节点类型
		if child is State:  # 如果子节点是 State类型
			states[child.name.to_lower()] = child # 就把这个 State类型节点的名字 加入到状态字典中 并转成小写
			child.fsm = self     # 把这个状态设置成自己的状态
			child.object = object  # 设置object为 child的 父节点
			
func update(delta):
	if not current_state: return
	current_state_node.update(delta)

func physics_update(delta):
	if not current_state: return
	current_state_node.physics_update(delta) # 把状态机的物理更新设置为 当前状态 节点 的物理更新


func chang_state(next_state):  # 检查~~如果触发下一个状态
	if current_state:  
		current_state_node.exit()  # 先调用当前节点的 exit()
	previous_state = current_state # 把当前状态修改为前一个状态
	current_state = next_state     # 把下一个状态修改为当前状态
	current_state_node = states[next_state] # 把字典里的下一个状态名 修改为当前状态节点
	current_state_node.enter()  # 并进入新的当前状态

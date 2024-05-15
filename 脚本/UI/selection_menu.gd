extends CanvasLayer

@export var selection_v_box : Node
var selection_items
var selection_index:
	get: return selection_index
	set(v):
		selection_index = clampi(v , 0 , selection_items.size() - 1)
		for i in selection_items.size():
			selection_items[i].modulate.a = 1.0 if i == selection_index else 0.3
			
			
func _ready() -> void:
	disable()
	selection_items = selection_v_box.get_children()
	selection_index = 0

func enable():
	set_process_input(true)
	
func disable():
	set_process_input(false)


func _input(event):
	if event.is_action_pressed("ui_down"):
		selection_index += 1
	elif event.is_action_pressed("ui_up"):
		selection_index -= 1
	elif event.is_action_pressed("ui_accept"):
		var selection = selection_items[selection_index]
		if selection.has_method("select"):
			selection.select()

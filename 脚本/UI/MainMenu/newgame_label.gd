extends Label

func select(): # 被input关联 所以可执行输入操作
	Game.main.transition.fade_out()
	Game.main.main_menu.disable()
	
	await Game.main.transition.faded_out
	get_tree().paused = true
	
	Game.main.main_menu.hide()
	Game.main.main.load_level("level_1")
	Game.main.transition.fade_in()
	
	await Game.main.transition.faded_in
	get_tree().paused = false

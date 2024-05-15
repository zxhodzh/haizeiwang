extends Label

func select():
	Game.main.transition.fade_in()
	get_tree().paused = true
	#Game.main.main.current_level.resume()
	
	Game.main.pause_menu.hide()
	Game.main.pause_menu.disable()
	
	await Game.main.transition.faded_in
	get_tree().paused = false

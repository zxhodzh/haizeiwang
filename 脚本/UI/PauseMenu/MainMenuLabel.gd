extends Label

func select():
	var main_menu = Game.main.main_menu
	var transition = Game.main.transition
	
	Game.main.pause_menu.disable()
	transition.fade_out()
	
	await transition.faded_out
	
	Game.main.pause_menu.hide()
	main_menu.show()
	main_menu.selection_index = 0
	Game.main.main.unload()
	await get_tree().process_frame
	get_tree().paused = false
	
	Game.main.parallax_background.scroll_offset = Vector2.ZERO
	
	
	transition.fade_in()
	await transition.faded_in
	main_menu.enable()
	

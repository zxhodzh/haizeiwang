extends Node2D

@onready var main_menu: CanvasLayer = $MainMenu
@onready var pause_menu: CanvasLayer = $PauseMenu
@onready var main: Node2D = $main
@onready var transition: CanvasLayer = $Transition
@onready var parallax_background: ParallaxBackground = $ParallaxBackground


func _ready() -> void:
	Game.main = self
	transition.fade_in()
	main_menu.show()
	
	await transition.faded_in
	
	main_menu.enable()

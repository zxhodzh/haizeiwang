extends ParallaxLayer



@export var speed := 30



func _process(delta: float) -> void:
	motion_offset.x -= speed * delta

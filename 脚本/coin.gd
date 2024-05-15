extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collect_sfx: AudioStreamPlayer = $collectSFX



func _on_body_entered(_body: Node2D) -> void:
	animated_sprite.play("collect")
	collect_sfx.play()

func _on_animated_sprite_animation_finished() -> void:
	queue_free()

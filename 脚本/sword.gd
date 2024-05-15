extends Area2D

@onready var pickup_sxf: AudioStreamPlayer = $PickupSXF
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _on_player_entered(player: Node2D) -> void:
	player.sword = true
	pickup_sxf.play()
	animated_sprite.visible = false
	collision_shape.set_deferred("disabled" , true)
	


func _on_pickup_sxf_finished() -> void:
	queue_free()

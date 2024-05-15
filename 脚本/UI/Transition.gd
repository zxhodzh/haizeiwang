extends CanvasLayer


@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal faded_in
signal faded_out

func fade_out():
	animation_player.play("fade_out")
	
func fade_in():
	animation_player.play("fade_in")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"fade_in":
			faded_in.emit()
		"fade_out":
			faded_out.emit()

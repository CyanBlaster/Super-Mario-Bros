extends AnimationPlayer
@export var animation_player : AnimationPlayer

func _process(_delta):
	animation_player.play("FIRE")
 

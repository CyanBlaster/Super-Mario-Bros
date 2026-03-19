extends Node2D
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(_delta):
	#print(Peach.velocity.x, '   ', Peach.velocity.y)
	if Peach.moving_direction.x >= 0:
		#print("son here 1")
		sprite.flip_h = false
	else:
		#print("son here 2")
		sprite.flip_h = true
	animation_player.play("Idle") 

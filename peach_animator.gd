extends Node2D
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
@export var statemachine : Node2D

func _process(_delta):
	#print(Peach.velocity.x, '   ', Peach.velocity.y)
	if Peach.moving_direction.x >= 0:
		#print("son here 1")
		sprite.flip_h = false
	else:
		#print("son here 2")
		sprite.flip_h = true
	#if(statemachine.current_state == "BossPowerup"):
		#animation_player.play("Powerup")
	#else:
	if(Peach.boss_health <= 25):
		animation_player.play("Fire_Idle") 
	else:
		animation_player.play("Idle")

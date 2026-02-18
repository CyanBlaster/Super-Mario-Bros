extends Node2D

@export var mario : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(_delta):
	if mario.direction == 1:
		sprite.flip_h = true
	elif mario.direction == -1:
		sprite.flip_h = false
	
	if abs(mario.velocity.x) > 0.0:
		if(mario.powerup == 2):
			animation_player.play("fire_walk")
		elif (mario.powerup == 1):
			animation_player.play("Walk")
	else:
		if(mario.powerup == 2):
			animation_player.play("fire_idle")
		elif (mario.powerup == 1):
			animation_player.play("idle")
	
	if mario.velocity.y > 0.0:
		if(mario.powerup == 2):
			animation_player.play("fire_fall")
		elif (mario.powerup == 1):
			animation_player.play("fall")
	if mario.velocity.y < 0.0:
		if(mario.powerup == 2):
			animation_player.play("fire_jump")
		elif (mario.powerup == 1):
			animation_player.play("jump")

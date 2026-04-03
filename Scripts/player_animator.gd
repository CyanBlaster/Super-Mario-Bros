extends Node2D

@export var mario : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D
@export var sprite2 : Sprite2D

func _process(_delta):
	if mario.direction == 1:
		sprite.flip_h = true
		sprite2.flip_h = false
	elif mario.direction == -1:
		sprite.flip_h = false
		sprite2.flip_h = true
	
	if abs(mario.velocity.x) > 0.0:
		if(mario.powerup == 5):
			animation_player.play("gold_walk")
			sprite2.show()
			sprite.hide()
		elif(mario.powerup == 4):
			animation_player.play("p_walk")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 3):
			animation_player.play("tanooki_walk")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 2):
			animation_player.play("fire_walk")
			sprite.show()
			sprite2.hide()
		elif (mario.powerup == 1):
			animation_player.play("Walk")
			sprite.show()
			sprite2.hide()
	else:
		if(mario.powerup == 5):
			animation_player.play("gold_idle")
			sprite2.show()
			sprite.hide()
		elif(mario.powerup == 4):
			animation_player.play("p_idle")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 3):
			animation_player.play("tanooki_idle")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 2):
			animation_player.play("fire_idle")
			sprite.show()
			sprite2.hide()
		elif (mario.powerup == 1):
			animation_player.play("idle")
			sprite.show()
			sprite2.hide()
	
	if mario.velocity.y > 0.0:
		if(mario.powerup == 5):
			animation_player.play("gold_fall")
			sprite2.show()
			sprite.hide()
		if(mario.powerup == 4):
			animation_player.play("p_fall")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 3):
			animation_player.play("tanooki_fall")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 2):
			animation_player.play("fire_fall")
			sprite.show()
			sprite2.hide()
		elif (mario.powerup == 1):
			animation_player.play("fall")
			sprite.show()
			sprite2.hide()
	if mario.velocity.y < 0.0:
		if(mario.powerup == 5):
			animation_player.play("gold_jump")
			sprite2.show()
			sprite.hide()
		elif(mario.powerup == 4):
			animation_player.play("p_jump")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 3):
			animation_player.play("tanooki_jump")
			sprite.show()
			sprite2.hide()
		elif(mario.powerup == 2):
			animation_player.play("fire_jump")
			sprite.show()
			sprite2.hide()
		elif (mario.powerup == 1):
			animation_player.play("jump")
			sprite.show()
			sprite2.hide()

extends Node2D
@export var six : Sprite2D
@export var five : Sprite2D
@export var four : Sprite2D
@export var three : Sprite2D
@export var two : Sprite2D
@export var one : Sprite2D
@export var player : CharacterBody2D

func _process(_delta: float) -> void:
	#print(Mario.health)
	if player.health == 1:
		three.hide()
		two.hide()
		one.show()
	elif player.health == 2:
		three.hide()
		two.show()
		one.hide()
	elif player.health >= 3:
		three.show()
		two.hide()
		one.hide()
	if player.health == 4:
		four.show()
		five.hide()
		six.hide()
	elif player.health == 5:
		four.hide()
		five.show()
		six.hide()
	elif player.health == 6: 
		four.hide()
		five.hide()
		six.show()
	else:
		four.hide()
		five.hide()
		six.hide()
	pass

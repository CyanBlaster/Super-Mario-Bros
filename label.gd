extends Label
@export var player : CharacterBody2D


func _process(_delta):
	if(player.invincible > 0):
		show()
	else:
		hide() 

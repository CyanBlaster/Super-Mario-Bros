extends Label
@export var player : CharacterBody2D


func _process(_delta):
	text = "Coins: " + str(player.coins + Mario.coins) 
 

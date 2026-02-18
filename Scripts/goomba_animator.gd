extends Node2D

@export var PlayerDetector : CollisionObject2D
@export var goomba : CharacterBody2D
@export var animation_player : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if(goomba.timer < 1):
		animation_player.play("death")
	else:
		animation_player.play("walk")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

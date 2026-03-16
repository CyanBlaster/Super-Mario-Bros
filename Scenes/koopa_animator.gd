extends Node2D

@export var PlayerDetector : CollisionObject2D
@export var koopa : CharacterBody2D
@export var animation_player : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if(koopa.speed > 0):
		animation_player.play("walking_right")
	else:
		animation_player.play("walking_left")

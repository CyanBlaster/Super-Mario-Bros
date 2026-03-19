extends Node2D
@export var PlayerDetector : CollisionObject2D
@export var block : CharacterBody2D
@export var animation_player : AnimationPlayer
# Called when the node enters the scene tree for the first time.
var hit = false
@onready var coin = preload("res://Scenes/coin.tscn")

var rng = RandomNumberGenerator.new()

func _process(_delta):
	if(hit):
		animation_player.play("hit")
	else:
		animation_player.play("idle") 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Mario"):
		var instance = coin.instantiate()
		instance.position.x = position.x 
		instance.position.y = position.y - 16
		add_child(instance)
		hit = true

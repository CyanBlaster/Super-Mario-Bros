extends Node2D
@export var PlayerDetector : CollisionObject2D
@export var block : CharacterBody2D
@export var animation_player : AnimationPlayer
# Called when the node enters the scene tree for the first time.
var hit = false
@onready var flower = preload("res://Scenes/fire_flower.tscn")
@onready var leaf = preload("res://Scenes/tanookiLeaf.tscn")
@onready var star = preload("res://Scenes/star.tscn")
var rng = RandomNumberGenerator.new()

func _process(_delta):
	if(hit):
		animation_player.play("hit")
	else:
		animation_player.play("Idle") 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Mario"):
		var powerup = rng.randf_range(0, 4.0)
		var instance
		if(powerup >= 0 && powerup < 1):	
			instance = flower.instantiate()
		elif(powerup >= 1 && powerup < 2):	
			instance = leaf.instantiate()
		else:
			instance = star.instantiate()
		instance.position.x = position.x 
		instance.position.y = position.y - 16
		add_child(instance)
		hit = true

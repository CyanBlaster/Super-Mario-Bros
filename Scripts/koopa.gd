extends CharacterBody2D
@export var speed: float
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Animator/Sprite2D
@onready var shell = preload("res://Scenes/shell.tscn")
@onready var coin = preload("res://Scenes/coin.tscn")
var burnt = false
var gold = false
var direction = 1


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(delta):
	velocity.x = speed * delta
	move_and_slide()


func _on_wall_detector_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && Mario.invincible > 0:
		die()
	elif body.name == "Mario" && Mario.invincible <= 0:
		print(body.name)
		Mario.dead = true
		print("I killed Mario")
	else:
		direction -= 1
		speed = -speed
	

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.name == "Mario":
		Mario.hit = true
		die()
	if body.name == "shell":
		die()



func die():
	velocity.x = 0
	print("shell")
	if(!burnt):
		var instance = shell.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y -16
		print(instance.position.x, " ", instance.position.y)

		get_tree().current_scene.add_child(instance) 
	elif(gold):
		var instance = coin.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y -16
		print(instance.position.x, " ", instance.position.y)
	queue_free()


func _on_player_detector_area_entered(area: Area2D) -> void:
	print("Area Name:", area.name)
	if (area.name.begins_with("fireball_")):
		print("die")
		burnt = true
		die()
	if (area.name.begins_with("goldball_")):
		print("die")
		gold = true
		burnt = true
		die()

extends CharacterBody2D

@export var speed: float
@export var dead = false
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Animator/Sprite2D
@onready var coin = preload("res://Scenes/coin.tscn")

@export var timer = 0.2
var timer_started : bool

func _ready() -> void:
	var direction = randf_range(-1, 1)
	if(direction >= 0):
		speed = speed
	else:
		speed = -speed

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(delta):
	velocity.x = speed * delta
	if timer_started:
		timer -= delta
	else:
		velocity.x = speed * delta
		move_and_slide()
	
	if timer <= 0:
		queue_free()
		timer_started = false
	
	
	

func _on_wall_detector_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && Mario.invincible > 0 && timer_started == false && dead == false:
		die() 
	else: 
		speed = -speed
	if body.name == "shell" && timer_started == false && dead == false:
		die()
	

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && timer_started == false && dead == false:
		Mario.hit = true
		die()



func die():
	dead = true
	collision_shape_2d.queue_free()
	velocity.x = 0
	timer_started = true


func _on_player_detector_area_entered(area: Area2D) -> void:
	if (area.name.begins_with("fireball_") || area.name.begins_with("enemyfire_")) && timer_started == false && dead == false:
		print("die")
		if(dead == false):
			die()
	elif(area.name.begins_with("goldball_")):
		var instance = coin.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y
		get_tree().current_scene.add_child(instance)
		print("gold die")
		if(dead == false):
			die()
	elif(area.name == "Player" && dead == false):
		Mario.hit = true
		die()
	else:
		print(area.name)

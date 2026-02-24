extends CharacterBody2D

@export var speed: float
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Animator/Sprite2D

@export var timer = 1.0
var timer_started : bool

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
	
	
	

func _on_wall_detector_body_entered(_body: Node2D) -> void:
	speed = -speed 
	

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && timer_started == false:
		die()



func die():
	collision_shape_2d.queue_free()
	velocity.x = 0
	timer_started = true



	


func _on_player_detector_area_entered(area: Area2D) -> void:
	print(area.name)
	if (area.name == "fireball" || area.name == "Area2D") && timer_started == false:
		print("die")
		die()

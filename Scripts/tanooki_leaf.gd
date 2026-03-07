extends CharacterBody2D

@export var mario : PlayerController
@onready var collision_shape_2d = $CollisionShape2D




func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(_delta):
	move_and_slide() 
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mario": 
		Mario.powerup = 3
		queue_free()

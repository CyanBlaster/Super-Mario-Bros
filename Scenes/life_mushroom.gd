extends CharacterBody2D
@export var speed = 5000
@onready var collision_shape_2d = $CollisionShape2D

func _ready() -> void:
	var direction = randf_range(-1, 1)
	if(direction >= 0):
		speed = speed
	else:
		speed = -speed
func _physics_process(delta: float) -> void:
	#velocity.x += speed * delta
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = speed * delta 
	move_and_slide()

	

func _on_life_mushroom_area_entered(area: Area2D) -> void:
	if(area.name == "Player"):
		queue_free()

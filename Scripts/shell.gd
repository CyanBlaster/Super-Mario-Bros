extends CharacterBody2D

@export var mario : PlayerController
@onready var collision_shape_2d = $CollisionShape2D
var speed = 0


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x = speed * delta
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(_delta):
	move_and_slide() 


func _on_player_detector_area_entered(_area: Area2D) -> void:
	Mario.hit = true
	if(speed != 0 && _area.name == "Player"):
		speed = 0
	else:
		speed = 20000
	



func _on_wall_detector_body_entered(_body: Node2D) -> void:
	speed = -speed
	

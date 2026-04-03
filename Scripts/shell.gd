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


func _on_player_detector_area_entered(area: Area2D) -> void:
	Mario.hit = true
	if(speed != 0 && area.name == "Player"):
		speed = 0
	elif(area.name.begins_with("fireball_")):
		queue_free()
	elif(area.name.begins_with("goldball_")):
		queue_free()
	else:
		speed = 20000
	



func _on_wall_detector_body_entered(_body: Node2D) -> void:
	speed = -speed
	

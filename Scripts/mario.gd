extends CharacterBody2D
class_name PlayerController 


@onready var projectile = preload("res://Scenes/fireball.tscn")
#@export var camera = load("camera")






@export var speed = 10.0
@export var jump_power = 10.0

static var powerup = 1
var speed_multiplier = 10
var jump_multiplier = -30
var sprint = 1
var jump_sprint = 1
@export var direction = 1
var d = 1
var balls = 0


func _ready() -> void: 
	position.y = 400

func _physics_process(delta: float) -> void:
	if(position.y > 800):
		position.x = -400
		position.y = 400
	# Add the gravity.
	if balls < 0:
		balls = 0
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier * jump_sprint

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		d = direction
	if direction:
		velocity.x = direction * speed * sprint * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * sprint * speed_multiplier)
	
	if Input.is_action_pressed("sprint"):
		sprint = 3
		jump_sprint = 1.25
	else:
		sprint = 1
		jump_sprint = 1.25
	if Input.is_action_just_pressed("fireball") && not (Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right")):
		#print(balls)
		if powerup == 2 && balls < 1:
			balls += 1
			print(balls)
			shoot()


	move_and_slide()
	
	
func shoot():
	var instance = projectile.instantiate()
	add_child(instance)
	instance.position = Vector2(0, 400)
	print(instance.position)
	print(position)
	if d == 1:
		instance.direction = 1
	else:
		instance.direction = -1
	instance.name = "fireball"
	#var instance = projectile.instantiate() 
	#instance.speed = 1
	#instance.spawnPos = Vector2(position.x, position.y)
	#instance.spawnRot = Mario.rotation
	#Mario.add_child.call_deferred(instance)

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "object":
		powerup = 2
		print("powerup")

extends CharacterBody2D
class_name PlayerController 

@onready var main = get_tree().get_root().get_node("World 1-1")
@onready var projectile = load("res://Scenes/fireball.tscn")

	




@export var speed = 10.0
@export var jump_power = 10.0

static var powerup = 1

var speed_multiplier = 10
var jump_multiplier = -30
var sprint = 1
var jump_sprint = 1
@export var direction = 0






func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier * jump_sprint

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
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
	if Input.is_action_pressed("fireball") && not (Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right")):
		if powerup == 2:
			shoot()
	

	move_and_slide()
	
	
func shoot():
	print("shoot")
	var instance = projectile.instantiate()
	instance.dir = 90
	instance.SPEED = 1
	instance.spawnPos = Mario.position
	instance.spawnRot = Mario.rotation
	main.add_child.call_deferred(instance)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("d")
	if body.name == "object":
		powerup = 2
		print("powerup")

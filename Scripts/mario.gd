extends CharacterBody2D
class_name PlayerController 


@onready var projectile = preload("res://Scenes/fireball.tscn")

@export var speed = 10.0
@export var jump_power = 10.0
@export var flight_power = 7
@export var hit = false

static var powerup = 1
var level = 1
var speed_multiplier = 10
var jump_multiplier = -30
var sprint = 1
var jump_sprint = 1
var cooldown = 0
@export var direction = 1
@export var oldpower = 1
@export var invincible = 0
@export var dead = false
var d = 1
var balls = 0


func _ready() -> void: 
	position.y = 400

func _physics_process(delta: float) -> void:
	if(position.y > 800):
		position.x = -400
		position.y = 400
	if(dead == true): 
		position.y = 2600
		dead = false
	if(hit):
		velocity.y = jump_power * jump_multiplier * jump_sprint
		hit = false
	
	if not is_on_floor(): 
		velocity += get_gravity() * delta
	
	# Handle jump. 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier * jump_sprint
	if Input.is_action_just_pressed("jump") and !is_on_floor() and powerup == 3:
		velocity.y = flight_power * jump_multiplier * jump_sprint
		if(flight_power > 0):
			flight_power -= 1
	if Input.is_action_just_pressed("jump") and !is_on_floor() and powerup == 4:
		velocity.y = flight_power * 3 * jump_multiplier * jump_sprint
		if(flight_power > 0):
			flight_power -= 1
	if is_on_floor(): 
		flight_power = 7
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
	if Input.is_action_just_pressed("fireball"):
		if powerup == 2:
			balls += 1 
			shoot()

	#Tracks invinciblity.
	if(invincible > 0):
		invincible -= delta
	if(cooldown > 0):
		cooldown -= delta
	
	
	move_and_slide()
	
	
func shoot():
	print("Mario shoot")
	var instance = projectile.instantiate()
	if d == 1:
		instance.direction = 1
	else:
		instance.direction = -1
	instance.name = "fireball_" + str(balls)
	instance.position = position
	get_tree().current_scene.add_child(instance)
	#add_child(instance)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Fire_flower":
		oldpower = powerup
		powerup = 2
	elif body.name == "leaf":
		oldpower = powerup
		powerup = 3
	



func _on_player_area_entered(area: Area2D) -> void:
	if((area.name == "GoombaWallDetector" or area.name == "Koopa_Wall_Detector" or area.name == "Peach_Collision") && cooldown <= 0 && invincible <= 0):
		if(powerup == 1):
			print("Ouch", invincible)
			dead = true
		else:
			powerup = 1
			cooldown = 1
	if(area.name == "GoombaPlayerDetector" or area.name == "PeachHitDetector"):
		velocity.y = jump_power * jump_multiplier * jump_sprint
		if(area.name == "PeachHitDetector"):
			Peach.boss_health -= 1
			print(Peach.boss_health)
	if area.name == "star":
		print(invincible)
		invincible = 10

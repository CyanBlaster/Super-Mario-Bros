extends State
class_name BossIdle

@export var peach: CharacterBody2D
@export var move_speed = 500.0
@onready var goomba = preload("res://Scenes/goomba.tscn")
@onready var fire = preload("res://Scenes/Levels/enemyfire.tscn")
@export var enemyfire = 0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	if(Peach.boss_health <= 25):
		fireball()
	move_direction = Vector2(randf_range(-1, 1), 0)
	wander_time = randf_range(1, 2)

func fireball():
	print("Fireball")
	var instance = fire.instantiate()
	if Peach.moving_direction.x > 0: 
		instance.direction = 1
	else:
		instance.direction = -1                            
	instance.name = "enemyfire_" + str(enemyfire)
	enemyfire += 1
	instance.position = peach.position
	print(instance.position)
	#print(Peach.position)
	#print(instance.position)
	get_tree().current_scene.add_child(instance)
func Update(delta : float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander() 
		
func Physics_Update(_delta: float):
	if Peach:   
		Peach.moving_direction = move_direction               
	 

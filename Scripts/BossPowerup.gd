extends State
class_name BossPowerup

@export var peach: CharacterBody2D
@export var move_speed = 500.0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	print("random")
	move_direction = Vector2(randf_range(-1, 1), 0)
	wander_time = randf_range(1, 3)

func Update(delta : float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander() 
		
func Physics_Update(_delta: float):
	if Peach:
		#Peach.velocity += move_direction * move_speed
		Peach.moving_direction = move_direction
	


	

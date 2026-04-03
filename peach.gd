extends CharacterBody2D
class_name boss
@onready var sprite : Sprite2D = $Animator/Sprite2D
@export var boss_health = 50
@export var moving_direction: Vector2
@export var velo : Vector2

var move_speed = 5

func _process(_delta: float) -> void:
	if(boss_health <= 0): 
		queue_free() 
		get_tree().change_scene_to_file("res://Scenes/Levels/ending.tscn")
	#print(boss_health)
	#print(get_node("/root/Peach/Animator"))
	#if velocity.x < 0:
		#sprite.flip_h = true 
	#else:
		#sprite.flip_h = false

func _physics_process(delta):
	#print(finalboss.position)
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	boss_health = Peach.boss_health 
	if(boss_health > 0):  
		velocity += Peach.moving_direction * move_speed
	
	move_and_slide() 
	
	

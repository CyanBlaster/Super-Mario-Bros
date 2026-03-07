extends CharacterBody2D
@export var mario : PlayerController
@onready var collision_shape_2d = $CollisionShape2D




func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(_delta):
	move_and_slide()
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && Mario.level == 1: 
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_2.tscn")
		queue_free()
		Mario.level += 1
		print("Level 2")
	elif body.name == "Mario" && Mario.level == 2: 
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_3.tscn")
		queue_free()
		Mario.level += 1 
		print("Level 3")

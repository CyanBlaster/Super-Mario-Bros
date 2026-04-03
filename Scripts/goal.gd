extends CharacterBody2D
@export var mario : PlayerController
@onready var collision_shape_2d = $CollisionShape2D




func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(_delta):
	move_and_slide()
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mario" && Mario.level == 0:
		mario.prev_coins = mario.coins
		print(mario.prev_coins)
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_1.tscn")
		queue_free()
		Mario.level += 1
		Mario.coins += mario.prev_coins 
		print(Mario.coins)
		print("Level 1")
	elif body.name == "Mario" && Mario.level == 1: 
		mario.prev_coins = mario.coins
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_2.tscn")
		queue_free()
		Mario.level += 1
		Mario.coins += mario.prev_coins 
		print("Level 2")
	elif body.name == "Mario" && Mario.level == 2: 
		mario.prev_coins = mario.coins
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_3.tscn")
		queue_free()
		Mario.level += 1 
		Mario.coins += mario.prev_coins 
		print("Level 3")
	elif body.name == "Mario" && Mario.level == 3: 
		mario.prev_coins = mario.coins
		get_tree().change_scene_to_file("res://Scenes/Levels/boss_level.tscn")
		queue_free()
		Mario.level += 1 
		Mario.coins += mario.prev_coins 
		print("boss_level")
	elif body.name == "Mario" && Mario.level == 4: 
		mario.prev_coins = mario.coins
		get_tree().change_scene_to_file("res://Scenes/Levels/boss_cutscene.tscn")
		queue_free()
		Mario.level += 1 
		Mario.coins += mario.prev_coins 
		print("boss_fight")

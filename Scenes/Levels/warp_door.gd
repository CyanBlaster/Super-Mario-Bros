extends Sprite2D
@export var mario : PlayerController
@onready var collision_shape_2d = $CollisionShape2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mario": 
		get_tree().change_scene_to_file("res://Scenes/Levels/boss_fight.tscn")
		queue_free()
		Mario.level += 1

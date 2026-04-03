extends Area2D
@export var sprite: Sprite2D


var speed = 500
var direction = Peach.moving_direction.x
var life = 1


func _ready() -> void:
	#name = "fireball_" + str(Mario.balls)
	
	print("I exist now")
	if(direction >= 0):
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func _process(delta: float) -> void:
	position.x += speed * direction * delta
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "Goomba"):
		print(area.name) 
		queue_free() 

func _on_area_entered(area: Area2D) -> void:
	if(area.name == "Goomba"):
		print(area.name) 
		queue_free()

extends Area2D

var speed = 500
var direction = Mario.direction
var life = 3

func _ready() -> void:
	pass
	position.y -= 10


func _process(delta: float) -> void:

	position.x += speed * direction * delta
	life -= delta
	if(life <= 0):
		#print("dead")
		Mario.balls -= 1
		#print(Mario.balls)
		queue_free()
 


	
	
	


func _on_area_entered(_area: Area2D) -> void:
	pass

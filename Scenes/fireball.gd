extends CharacterBody2D

@export var SPEED = 1

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready():
	Mario.position = spawnPos
	Mario.rotation = spawnRot
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(Mario.position.x, SPEED)
	#move_and_slide()

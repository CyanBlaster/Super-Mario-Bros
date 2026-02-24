extends Node2D

@onready var label: Label = $Label
var score = 0

func _ready() -> void:
	label.text = "score"
#Make princess peach with a gun boss level
func _process(_delta: float) -> void:
	label.text = "score"

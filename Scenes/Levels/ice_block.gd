extends CharacterBody2D






func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name.begins_with("fireball_") || area.name.begins_with("goldball_")):
		queue_free()
 

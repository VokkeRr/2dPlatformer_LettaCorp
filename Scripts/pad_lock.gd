extends Area2D

func change_scene(scene):
	get_tree().change_scene_to_file(scene)
	
func _on_body_entered(body):
	if body.is_in_group("Player") and body.key_collected:
		call_deferred("change_scene","res://Scenes/level_completed.tscn") 
		#Тут можно сдеать LEVEL + и инкремент чтобы каждый раз менялись уровни
		#А в меню кномпи с выбором уровней через эту же функцию с цифрами

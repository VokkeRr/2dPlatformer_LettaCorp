extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("collected")
		body.coins_collected += 1
		$"../../UI/Control".update_coin_text(body.coins_collected)
		$CoinCollected.play()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()

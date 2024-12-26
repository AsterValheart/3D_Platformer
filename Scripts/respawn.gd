extends Area3D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.game_over()



#old code in case i need it
#func _on_body_entered(body: Node3D) -> void:
#	$HitHurt.play()
#	set_physics_process(false)
#	get_node("../BG").stop()
#	timer.start()
#	
#func _on_timer_timeout() -> void:
#	get_tree().reload_current_scene()

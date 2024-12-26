extends Area3D

var spin_speed : float = 3.0
var bob_height : float = 0.3
var bob_speed : float = 4.0

@onready var start_y : = global_position.y
var time : float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(Vector3.UP, spin_speed * delta)
	
	time += delta
	var d = (sin(time * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)



func _on_body_entered(body: Node3D) -> void:
		if body.is_in_group("Player"):
			$"../../SFX/PickupCoin".play()
			body.add_score(1)
			queue_free()

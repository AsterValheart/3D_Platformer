extends CharacterBody3D

var move_speed : float = 7.0
var jump_force : float = 10.0
var gravity : float = 25.0

var facing_angle : float

var score : int

@onready var timer: Timer = $Timer

@onready var model : MeshInstance3D = get_node("Model")
@onready var score_text : Label = get_node("ScoreText")

#gravity = true
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	# get player inpout
	var input = Input.get_vector("move_left","move_right","move_forward","move_backward")
	
	# calculate move direction
	var dir = Vector3(input.x, 0, input.y)
	
	# assign direction to velocity
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	# apply velocity
	move_and_slide()
	
	# if moving, set facing direction
	if input.length() > 0:
		facing_angle = Vector2(input.y, input.x).angle()
	
	#rotate model
	model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.5)
	#game over stuff


func game_over ():
	$"../SFX/HitHurt".play()
	set_physics_process(false)
	get_node("../SFX/BG").stop()
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
func add_score (amount):
	score += amount
	score_text.text = str("Score: ", score)

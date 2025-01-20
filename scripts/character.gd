extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -6000.0

@export var timeAttack :float = 0.3
@export var timeDecay :float = 0.1

var double_jump_active = false
var timer  : float = 0.0

var state : State
var state_floor_ : StateFloor

var jump_pressed :bool = false
func _ready():
	initialize_state_jump()
	
	pass
func _physics_process(delta):
	
	timer += delta
	
	if(Input.is_action_pressed("jump")):
		jump_pressed = true
	else:
		jump_pressed = false
		
		
	
	state = state.get_next_state()
	state.calculated_speed()

			
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

func initialize_state_jump():
	var state_attack = StateAttack.new()
	var state_decay = StateDecay.new()
	var state_sustain = StateSustain.new()
	var state_release = StateRelease.new()
	var state_floor = StateFloor.new()
	
	state_attack.player = self
	state_decay.player = self
	state_sustain.player = self
	state_release.player = self
	state_floor.player = self
	
	state_attack.next_state = state_decay
	state_decay.next_state = state_sustain
	state_sustain.next_state = state_release
	state_release.next_state = state_floor
	state_floor.next_state = state_attack
	
	state_attack.time_limit = timeAttack
	state_decay.time_limit = timeDecay
	
	state=state_release
	state_floor_ = state_floor
	pass

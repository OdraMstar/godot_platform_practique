extends CharacterBody2D

enum State
{
	FLOOR,
	ATTACK,
	DECAY,
	SUSTAIN,
	RELEASE,
} 

const SPEED = 300.0
const JUMP_VELOCITY = -40000.0

var double_jump_active = false
var current_state = State.RELEASE
var timer  : float = 0.0

func _physics_process(delta):
	# Add the gravity.
	timer += delta

	if( current_state == State.ATTACK):
		#print(current_state)
		if( timer<=0.3 ):
			velocity.y += JUMP_VELOCITY * delta * timer
			pass
		else:
			timer = 0
			current_state = State.DECAY
			velocity.y = 0
		pass
	if( current_state == State.DECAY):
		if( timer<=0.1 ):
			velocity.y -= JUMP_VELOCITY * delta * timer
			pass
		else:
			timer = 0;
			current_state = State.SUSTAIN
		pass
	if(current_state == State.SUSTAIN && Input.is_action_pressed("jump")):
		timer = 0;
		velocity.y = 0
		pass
	if(current_state == State.SUSTAIN && not Input.is_action_pressed("jump")):
		timer = 0
		velocity.y = 0
		current_state = State.RELEASE
	
	if not is_on_floor() && (current_state == State.RELEASE || current_state == State.FLOOR):
		velocity += get_gravity() * (timer ** 2) * delta
		pass
	
	if is_on_floor():
		timer = 0
		current_state = State.FLOOR
		pass
		
	# Handle jump.
	if Input.is_action_pressed("jump") and (current_state == State.FLOOR && is_on_floor()) :
		double_jump_active = true
		current_state = State.ATTACK
		#print(current_state)
		pass
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

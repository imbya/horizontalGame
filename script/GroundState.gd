extends State
class_name GroundState
@export var jump_velocity :float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump_start"
@export var attack1_animation : String = "attack"
@export var attack_state : State
@onready var buffer_timer: Timer = $BufferTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
	
func state_process(delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("Attack")):
		attack()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack1_animation)

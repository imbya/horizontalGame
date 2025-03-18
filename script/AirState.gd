extends State
class_name AirState

@export var landing_state : State
@export var ground_state : GroundState
@export var double_jump_velocity : float = -150
@export var double_jump_animation : String = "jump_double"
@export var landing_animation : String = "landing"

var has_double_jump : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jump):
		jump_double()

func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jump = false

func jump_double():
	
	character.velocity.y = double_jump_velocity
	#animated_sprite_2d.play("jump_double")
	playback.travel(double_jump_animation)
	has_double_jump = true

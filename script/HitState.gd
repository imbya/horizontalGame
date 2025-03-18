extends State

class_name HitState

@export var damageable : Damageable
@export var character_state_machine : CharacterStateMachine
@export var dead_state : State
@export var dead_animation_node : String = "dead"
@export var knockback_speed : float = 50.0
@export var return_state : State
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damageable.connect("on_hit",on_damageable_hit)

func on_enter():
	
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_damageable_hit(node : Node , damage_amount : int,knockback_direction : Vector2):
	if(damageable.health>0):
		character.velocity = knockback_speed * knockback_direction
		emit_signal("interupt_state" , self)
	else:
		emit_signal("interupt_state" , dead_state)
		playback.travel(dead_animation_node)

func on_exit():
	character.velocity = Vector2.ZERO

func _on_timer_timeout() -> void:
	next_state = return_state

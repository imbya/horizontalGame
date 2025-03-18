extends State

var has_double_attack : bool = false
@export var return_animation_node : String = "move"
@export var return_state : State
@export var attack2_animation : String = "attack2"
@export var ground_state : State
@export var attack1_animation : String = "attack1"
@onready var timer: Timer = $Timer

func state_input(event : InputEvent):
	if(event.is_action_pressed("Attack")):
		timer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func on_exit():
	#if(next_state == landing_state):
		#playback.travel(landing_animation)
		#has_double_jump = false

#func attack_double():
	#
	#playback.travel(attack2_animation)
	#has_double_attack = true


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == attack1_animation):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
		else:
			playback.travel(attack2_animation)
	if(anim_name == attack2_animation):
		next_state = return_state
		playback.travel(return_animation_node)

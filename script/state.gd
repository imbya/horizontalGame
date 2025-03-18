extends Node

class_name State

var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

signal interupt_state(new_state : State)
@export var can_move : bool = true

func state_input(event : InputEvent):
	pass

func on_enter():
	pass

func on_exit():
	pass

func state_process(delta):
	pass

extends Node

class_name PlayerDamageable 

signal on_hit(node : Node, damage_take : int)

@export var health : float = 20 :

	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed",get_parent(),value-health)
		health = value

@export var dead_animation_node : String = "dead"

func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit",get_parent(),damage)


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == dead_animation_node):
		get_parent().queue_free()

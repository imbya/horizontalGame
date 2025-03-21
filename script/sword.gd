extends Area2D

@export var damage : int = 10
@export var player : Player
@export var facing_direction_shape2d : facingCollisionShape

func _ready() -> void:
	monitoring = false
	player.connect("facing_direction_changed",_on_player_facing_direction_changed)
	
func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Damageable:
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			
			if(direction_sign > 0):
				child.hit(damage,Vector2.RIGHT)
			elif(direction_sign < 0):
				child.hit(damage,Vector2.LEFT)
			else:
				child.hit(damage,Vector2.ZERO)
			#child.hit(damage)
			#print_debug(body.name + "took " + str(damage) + " damage.")

func _on_player_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_direction_shape2d.position = facing_direction_shape2d.facing_right_position
	else:
		facing_direction_shape2d.position = facing_direction_shape2d.facing_left_position

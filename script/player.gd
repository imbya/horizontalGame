extends CharacterBody2D

class_name Player

@export var speed : float = 200.0
#@export var jump_velocity :float = -200.0
#@export var double_jump_velocity : float = -150

#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D
@onready var character_state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var animation_tree: AnimationTree = $AnimationTree

signal facing_direction_changed(facing_right : bool)

#var animation_locked : bool = false

#var has_double_jump : bool = false

var direction : Vector2 = Vector2.ZERO

#var was_in_air : bool = false

func _ready():
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		#was_in_air = true

	direction = Input.get_vector("left", "right","down","up")
	#if direction.x !=0 && animated_sprite_2d.animation != "jump_end":
		#velocity.x = direction.x * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
	if direction.x !=0 && character_state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)


	move_and_slide()
	update_animation_parameters()
	update_facing_direction()

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position",direction.x)
	#if not animation_locked:
		#if not is_on_floor():
			#animated_sprite_2d.play("jump_air")
		#else:
			#if direction.x != 0:
				#animated_sprite_2d.play("run")
			#else:
				#animated_sprite_2d.play("idle")
		
func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
		
	elif direction.x < 0:
		
		sprite.flip_h = true
	emit_signal("facing_direction_changed",!sprite.flip_h)

#func jump():
	#velocity.y = jump_velocity
	##animated_sprite_2d.play("jump_start")
	#animation_locked = true

#func land():
	##animated_sprite_2d.play("jump_end")
	#animation_locked = true

#func jump_double():
	#velocity.y = double_jump_velocity
	##animated_sprite_2d.play("jump_double")
	#animation_locked = true
	#has_double_jump = true

#func _on_animated_sprite_2d_animation_finished() -> void:
	#if(["jump_end","jump_start","jump_double"].has(animated_sprite_2d.animation)):
		#animation_locked = false

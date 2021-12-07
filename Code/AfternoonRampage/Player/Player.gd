#Node
extends KinematicBody2D
#Variables
var input_vector: Vector2 = Vector2.ZERO # Input Recivers 
var     velocity: Vector2 = Vector2.ZERO # Movement Calcuation
var        speed:   float = 400          # Top speed for player movement
#Functions
func _physics_process(delta):
    # Getting Input
    input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
    # Movement
#	velocity = move_and_slide(velocity.move_toward(input_vector * speed, speed * 1.5 * delta))
    velocity = move_and_slide(input_vector * speed)

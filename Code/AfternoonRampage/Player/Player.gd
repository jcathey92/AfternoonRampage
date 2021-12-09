#Node
extends KinematicBody2D
#Class
class_name Player
#Variables
var   input_vector: Vector2 = Vector2.ZERO # Input Recivers 
var       velocity: Vector2 = Vector2.ZERO # Movement Calcuation
export var   speed: float = 300            # Top speed for player movement
var   acceleration: float = 5 
var   deceleration: float = 2.5 
onready var  sprite: AnimatedSprite = $AnimatedSprite
var invetory: int = 4
#Functions
func _physics_process(delta):
	# Getting Input
	input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	# Movement
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * speed, speed * acceleration * delta) 
	else:
		velocity = velocity.move_toward(Vector2.ZERO,speed * deceleration * delta)
	velocity = move_and_slide(velocity)
	sprite.frame = invetory
func pickup(gift):
	invetory = gift
func dropoff():
	invetory = 4

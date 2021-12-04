#Node
extends KinematicBody2D
class_name Player
#Variables
var input_vector: Vector2 = Vector2.ZERO # Input Recivers 
var     velocity: Vector2 = Vector2.ZERO # Movement Calcuation
var        speed:   float = 400          # Top speed for player movement
var acceleration:   float = 4
var    Inventory:   Array = []
#Functions
func _physics_process(delta):
# Getting Input
	input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
# Movement
	velocity = move_and_slide(velocity.move_toward(input_vector * speed, speed * acceleration * delta))
#Debug
	if Input.is_action_just_pressed("ui_accept"):
		print(Inventory)
func pick_up_gift(gift_type):
	if Inventory.size() <= 0:
		Inventory.append(gift_type) 

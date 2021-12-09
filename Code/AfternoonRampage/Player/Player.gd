#Node

extends KinematicBody2D

#Class

class_name Player

#Scene Nodes

onready var gifticon: AnimatedSprite = $GiftIconSprite

#Variables

var   input_vector: Vector2 = Vector2.ZERO # Input Recivers 
var       velocity: Vector2 = Vector2.ZERO # Movement Calcuation
export var   speed:   float = 300          # Top speed for player movement
var   acceleration:   float = 3            #
var   deceleration:   float = 5            # Increase to lessen slideyness
var      inventory:     int = 4            # Is based of AnimatedSprite's frame count:

#Functions

# This function runs every frame
func _physics_process(delta):
	# Getting Input
	input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	
	# Movement
	
	  # Moving
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * speed, speed * acceleration * delta) 
	  # Not Moving
	else:
		velocity = velocity.move_toward(Vector2.ZERO,speed * deceleration * delta)
	velocity = move_and_slide(velocity)
	
	
	# Gift Inventory System
	
	  # Sets Gift Icon's AnimatedSprite(GiftIconSprite)
	gifticon.frame = inventory
	  # If is inventory is empty, hide Icon(GiftIconSprite)
	if inventory == 4:
		gifticon.hide()
	  # If is inventory isn't empty, show Icon(GiftIconSprite)
	else:
		gifticon.show()

# This Function is for when you pick up gifts, only called inside of the Gift.gd
func pickup(gift):
	inventory = gift
	
# This Function is for when you drop off gifts, only called inside of the DeliveryBox.gd
func dropoff():
	inventory = 4

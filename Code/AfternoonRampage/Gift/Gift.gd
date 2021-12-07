extends Area2D
class_name Gift
#enum gifts?
var picker: int
export var gift_type: int
var gift: String
onready var GiftSprite: AnimatedSprite = $AnimatedSprite

#Gift Types :Placeholder: The Colors and Sprites are just for testing purposes for right now:
enum{
	Necklace,
	Duck,
	Cake 
}

func _ready():
	# Random picks type of gift
	picker = round(rand_range(0,2))
	if picker == 0:
		gift_type = Necklace
	elif picker == 1 :
		gift_type = Duck
	else:
		gift_type = Cake
	# Sets Gift Properties
	match gift_type:
		Necklace:
			gift = "Necklace"
			GiftSprite.frame = 0
		Duck:
			gift = "Duck"
			GiftSprite.frame = 1
		Cake:
			gift = "Cake"
			GiftSprite.frame = 2

func _on_Gift_body_entered(body):
	if body is Player:
		if body.Inventory.size() <= 0:
			body.pick_up_gift(gift)
			queue_free()

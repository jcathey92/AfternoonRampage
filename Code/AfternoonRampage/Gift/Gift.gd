extends Area2D
class_name Gift
#enum gifts?
var picker: int
export var gift_type: int
var gift: String
onready var GiftSprite: Sprite = $Sprite

#Gift Types :Placeholder: The Colors and Sprites are just for testing purposes for right now:
enum{
	Green,
	Yellow,
	Purple 
}

func _ready():
	# Random picks type of gift
	picker = round(rand_range(0,2))
	if picker == 0:
		gift_type = Green
	elif picker == 1 :
		gift_type = Yellow
	else:
		gift_type = Purple
	# Sets Gift Properties
	match gift_type:
		Green:
			gift = "Green"
			GiftSprite.frame = 0
		Yellow:
			gift = "Yello"
			GiftSprite.frame = 1
		Purple:
			gift = "Purple"
			GiftSprite.frame = 2

func _on_Gift_body_entered(body):
	if body is Player:
		if body.Inventory.size() <= 0:
			body.pick_up_gift(gift)
			queue_free()

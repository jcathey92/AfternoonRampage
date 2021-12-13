extends Area2D
class_name Gift

# enum gift types?

onready var sprite: AnimatedSprite = $Sprite
enum{
    Box,
    Cake,
    Necklace,
    Duck
}
export var gift: int
var gift_type

func _ready():
    pass
#	gift = randi() % 3

func _process(delta):
    match gift:
        Box:
            sprite.frame = Box
        Cake:
            sprite.frame = Cake
        Necklace:
            sprite.frame = Necklace
        Duck:
            sprite.frame = Duck


func _on_Gift_body_entered(body):
    if body is Player:
        body.pickup(gift)

extends Area2D

@export var speed = 500 

func _ready() -> void:    
	var tween = create_tween()
	# prendo laserImage, lo scalo fino a grandezza 0.2 in 0.15 secondi, partendo da grandezza 0
	tween.tween_property($laserImage, 'scale', Vector2(0.2, 0.2 ), 0.15).from(Vector2(0, 0))


func _process(delta: float) -> void:
	position.y -= speed * delta

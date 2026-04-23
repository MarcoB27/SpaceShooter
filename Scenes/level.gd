extends Node2D

signal cooldown
#1 add meteor to scene
var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")

func _ready() -> void:
	# stars
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		# position
		var random_x = rng.randi_range(0, size.x)
		var random_y = rng.randi_range(0, size.y)
		star.position = Vector2(random_x, random_y)

func _on_meteor_timer_timeout() -> void:
	#2 create instance
	var meteor = meteor_scene.instantiate()
	
	#3 attach node to scene tree
	$Meteors.add_child(meteor)


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos

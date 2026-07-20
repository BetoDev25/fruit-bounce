extends Node2D

@export var peach_scene: PackedScene
var score

@onready var timer = $FruitTimer
@onready var label = $Display/Timer
@onready var spawn_location = $FruitPath/FruitSpawnLocation

func _ready():
	timer.wait_time = 5.0
	timer.start()

func _process(_delta):
	var seconds = int(floor(timer.time_left + 0.01))
	var minutes = floor(seconds / 60)
	var remaining_seconds = seconds % 60
	label.text = str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2)
	spawn_location.progress += 50 * _delta

func _on_fruit_timer_timeout():
	var fruit = peach_scene.instantiate()
	fruit.position = spawn_location.global_position
	fruit.game_over.connect(_on_game_over)  # Connect the spawned peach's signal
	add_child(fruit)
	
	timer.start()

func _on_game_over():
	timer.stop()
	print("Game Over!")
	var peaches = get_tree().get_nodes_in_group("peaches")
	for peach in peaches:
		peach.queue_free()

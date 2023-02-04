extends KinematicBody2D

var speed = 300
var ball


func _ready():
	ball = get_parent().find_node("Ball")
	#if ball = true
#	print(abs(ball.position.y))

func _physics_process(delta):
#	print(get_opponent_direction())
	move_and_slide(Vector2(0,get_opponent_direction()) * speed)

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0


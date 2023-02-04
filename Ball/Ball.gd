extends KinematicBody2D

var speed = 500
# outside physics process
# effectively global scope, which is why it is not in a function
var velocity = Vector2.ZERO

func _ready():
	randomize()
	# horizontal speed
	velocity.x = [-1,1][randi() % 2] # randi == random integer; in this case a 0 or 1
	# vertical speed
	velocity.y = [-0.8,0.8][randi() % 2] # randi == random integer; in this case a 0 or 1

func _physics_process(delta):
#	move_and_slide(velocity * speed)
	
# making ball bounce with move and collide
	# delta = way to account for faster or slower framerate
	var collsion_object = move_and_collide(velocity * speed * delta) # return collison value
	if  collsion_object:
		velocity = velocity.bounce(collsion_object.normal)
		

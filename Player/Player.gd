extends KinematicBody2D

# _process and _physics_process are executed with every frame
# vectors - an arrow that can point in different directions
# in this context different directions depending on input

var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"): # start testing keyboard input
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"): # start testing keyboard input	
		velocity.y += 1
	move_and_slide(velocity * speed)

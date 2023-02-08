extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_Left_body_entered(body):
	score_achieved()
	# print("Collision")
	#$Ball.position = Vector2(640,360)
	OpponentScore += 1
	# see 1 hour 48 min for explanatino of get_tree
	# 
	#get_tree().call_group('BallGroup', 'stop_ball')
	# call timer function
	# first target node of timer
	#$CountDownTimer.start()


func _on_Right_body_entered(body):
	score_achieved()
	#$Ball.position = Vector2(640,360)
	#PlayerScore += 1
	#get_tree().call_group('BallGroup', 'stop_ball')
	#$CountDownTimer.start()	
	PlayerScore += 1
	
func _process(delta): # just setting some text
	
	$PlayerScore.text = str(PlayerScore) # attributes listed at right on 2d view
	$OpponentScore.text = str(OpponentScore) # attributes listed at right on 2d view
	$CountDownLabel.text = str(int($CountDownTimer.time_left ) + 1)



func _on_CountDownTimer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountDownLabel.visible = false


func score_achieved():
	$Ball.position = Vector2(640,360)
	
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountDownTimer.start()	
	$CountDownLabel.visible = true
	# sound at score time
	$ScoreSound.play()
	# setting position of players
	$Player.position.x = 35 # pixels from left sid eof screen
	$Opponent.position.x = 1280 - 35 # pixels from left sid eof screen

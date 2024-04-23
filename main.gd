extends Node2D

var rng = RandomNumberGenerator.new()
var correct_button = 1
var dict = Global.dict
var dict3
var momentum
var time_left = 90
var clock_state = 1
var idk
var score = 0

func _ready():
	randomize_me_now()
	timer_reduce_check()
	$TimeChange.change_time(90, true)
	while time_left > 0:
		await get_tree().create_timer(2).timeout
		time_left -= 1
		timer_reduce_check()

func test_correctness(butt):
	if butt == correct_button:
		$Correct.play()
		$TimeChange.change_time(2, true)
		$ScoreChange.change_time(25 + time_left, true)
		score += 25 + time_left
		time_left += 2
		timer_reduce_check()
		$ScoreCount.text = str(score)
	else:
		$False.play()
		$TimeChange.change_time(5, false)
		time_left -= 5
		timer_reduce_check()
	randomize_me_now()


func timer_reduce_check():
	$ClockyThingy.update_timer(time_left)
	idk = (105 - time_left) / 10
	if idk > clock_state:
		clock_state = idk
		$ClockyThingy.change_broken(clock_state)
	if time_left <= 0:
		if score > Global.bestscore:
			Global.bestscore = score
		Global.saveGame()
		get_tree().change_scene_to_file("res://main.tscn")

func _process(delta):
	pass

func randomize_me_now():
	momentum = rng.randi_range(2, 168136)
	dict3 = dict[momentum][2][0] + dict[momentum][2][1] + dict[momentum][2][2]
	while len(dict[momentum][0]) < 3 or dict3.to_lower() == "see" or len(dict[momentum][0]) > 15 or dict3.to_lower() == "of " or dict3.to_lower() == "alt":
		momentum = rng.randi_range(2, 168136)
		dict3 = dict[momentum][2][0] + dict[momentum][2][1] + dict[momentum][2][2]
	$Label.text = dict[momentum][2]
	correct_button = rng.randi_range(1, 4)
	$ButtonOption1.text = dict[rng.randi_range(2, 168136)][0]
	$ButtonOption2.text = dict[rng.randi_range(2, 168136)][0]
	$ButtonOption3.text = dict[rng.randi_range(2, 168136)][0]
	$ButtonOption4.text = dict[rng.randi_range(2, 168136)][0]
	get_node("ButtonOption" + str(correct_button)).text = dict[momentum][0]

func _on_button_option_1_button_down():
	test_correctness(1)
func _on_button_option_2_button_down():
	test_correctness(2)
func _on_button_option_3_button_down():
	test_correctness(3)
func _on_button_option_4_button_down():
	test_correctness(4)

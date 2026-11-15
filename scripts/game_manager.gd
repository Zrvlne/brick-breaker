extends Node

var score = 0
var level = 1

func _ready() -> void:
	$BGM.play()

func addPoints(points):
	score += points

func _process(_delta: float) -> void:
	$CanvasLayer/ScoreLabel.text = str(score)
	$CanvasLayer/LevelLabel.text = "Level: " + str(level)

func playBreak():
	$Hit.play()

func playBomb():
	$Bomb.play()

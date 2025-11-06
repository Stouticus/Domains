extends Node
class_name Player

# Player info
var player_name: String = "Player"
var money: int = 10

# Team of Members
var team: Team = Team.new()

# Called at the start of each turn
func start_turn():
	money += 5  # Grant income
	print("%s starts turn with %d gold." % [player_name, money])

# Hire a recruit from a Shop
func hire_recruit(shop: Shop, index: int):
	if shop.hire(self, index):
		print("%s successfully added recruit to Team." % player_name)
	else:
		print("%s failed to hire recruit at index %d." % [player_name, index])

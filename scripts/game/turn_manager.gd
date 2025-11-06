# res://scripts/game/turn_manager.gd
extends Node
class_name TurnManager

func next_turn(campaign: Campaign):
	campaign.turn_number += 1
	campaign.start_turn()

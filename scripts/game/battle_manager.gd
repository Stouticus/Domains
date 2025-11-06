# res://scripts/game/battle_manager.gd
extends Node
class_name BattleManager

func start_battle(player_team: Team, opponent_team: Team):
	print("Battle started!")
	# Placeholder: loop through Members and simulate combat
	for member in player_team.members:
		print("%s is ready to fight!" % member.name)
	for member in opponent_team.members:
		print("%s is ready to fight!" % member.name)
	print("Battle ended! (Placeholder logic)")

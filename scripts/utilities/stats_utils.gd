# res://scripts/utilities/stat_utils.gd
extends Node
class_name StatUtils

static func scale_stats(base_stats: Dictionary, rank: int) -> Dictionary:
	var stats = base_stats.duplicate()
	for key in stats.keys():
		stats[key] += rank - 1
	return stats

func rarity_stat_bonus(rarity: String) -> int:
	match rarity:
		"Common":
			return 0
		"Uncommon":
			return 1
		"Rare":
			return 2
		"Epic":
			return 3
	return 0

func rarity_cost_modifier(rarity: String) -> int:
	match rarity:
		"Common":
			return 0
		"Uncommon":
			return 2
		"Rare":
			return 4
		"Epic":
			return 6
	return 0

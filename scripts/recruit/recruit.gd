extends Resource
class_name Recruit

var name: String = "New Recruit"
var domain: String = ""
var rank: int = 1
var rarity: String = "Common"
var cost: int = 5
var base_stats: Dictionary = {}  # e.g., PATK, MATK, PDEF, MDEF, SPD, HP

# Randomize recruit for testing purposes
func randomize_stats():
	var domains = ["Ninja", "Pirate", "Undead"]
	var rarities = ["Common", "Uncommon", "Rare", "Epic"]
	domain = domains[randi() % domains.size()]
	rarity = rarities[randi() % rarities.size()]
	rank = 1 + randi() % 4
	name = "Recruit"
	cost = 3 + rank * 3
	base_stats = {"PATK": 2+rank, "MATK": 2+rank, "PDEF": 1+rank, "MDEF": 1+rank, "SPD": 2+rank, "HP": 5+rank}

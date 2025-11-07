extends Resource
class_name Recruit

# --- Core Recruit Data ---
var name: String = "Recruit"
var domain1: String = ""
var domain2: String = ""
var level: int = 1
var rarity: String = "Common"
var cost: int = 5
var base_stats: Dictionary = {}
var abilities: Array = []

# --- References ---
var domains := preload("res://scripts/utilities/domains.gd").new()

# --- Randomize Recruit for Shop Testing ---
func randomize_stats(team_level: int):
	var rarities = ["Common", "Uncommon", "Rare", "Epic"]
	var rarity_roll := randf() * 100.0

	if rarity_roll < 59.0:
		rarity = "Common"
	elif rarity_roll < 89.0:
		rarity = "Uncommon"
	elif rarity_roll < 99.0:
		rarity = "Rare"
	else:
		rarity = "Epic"

	# Pick random domain & rarity
	domain1 = domains.get_random_domain()
	domain2 = domains.get_random_domain()
	
	level = randi() % team_level + 1

	# Get base stats
	base_stats = {
		"PATK": randi() % 3 + team_level, 
		"MATK": randi() % 3 + team_level, 
		"PDEF": randi() % 3 + team_level, 
		"MDEF": randi() % 3 + team_level, 
		"SPD": randi() % 3 + team_level, 
		"HP": randi() % 5 + team_level * 5, 
	}
	
	# Update stats using Domains
	base_stats = apply_domain_mods(base_stats)
	
	# Set abilities
	abilities = [
		domains.get_domain_abilities(domain1), 
		domains.get_domain_abilities(domain2)
	]

	# Scale stats by rank
	scale_stats_by_rank()

	# Compute cost using rank & rarity
	var rarity_multiplier: float = 1.0
	match rarity:
		"Common":
			rarity_multiplier = 1.0
		"Uncommon":
			rarity_multiplier = 1.5
		"Rare":
			rarity_multiplier = 2.0
		"Epic":
			rarity_multiplier = 3.0
		_:
			rarity_multiplier = 1.0
	cost = int((3 + level) * rarity_multiplier)

func apply_domain_mods(base_stats: Dictionary) -> Dictionary:
	var final_stats = base_stats.duplicate()
	var mods1 = domains.get_domain_stat_mods(domain1)
	var mods2 = domains.get_domain_stat_mods(domain2)

	for domain_mods in [mods1, mods2]:
		for stat in domain_mods.keys():
			if stat in final_stats:
				final_stats[stat] += domain_mods[stat]

	return final_stats

# --- Scale Stats by Rank ---
func scale_stats_by_rank():
	for key in base_stats.keys():
		base_stats[key] += (level - 1)

# --- Debug Helper ---
func print_recruit_info():
	print("%s | Domains: %s $s | Level: %d | Rarity: %s | Cost: %d" %
		[name, domain1, domain2, level, rarity, cost])
	print("  Stats:")
	for key in base_stats.keys():
		print("   %s | %d" % [key, base_stats[key]])
	print("  Abilities: %s" % str(abilities))

extends Resource
class_name Domains

# --- Domain Definitions ---
# Each domain defines flavor, stat modifiers, and ability tags.
# Base stats are applied when recruits are generated.

var DOMAIN_DATA := {
	"Pirate": {
		"description": "Brash adventurers of the sea, valuing treasure and rum",
		"stat_mods": {"PATK": 2, "MDEF": 2, "HP": 1},
		"abilities": {
			"Treasure Hunter": "",
			"Brawler": ""
		}
	},
	"Undead": {
		"description": "Souls bound to decay, feeding on dark magic.",
		"stat_mods": {"MDEF": 3, "HP": 2},
		"abilities": {
			"Rise Again": "",
			"Undying": ""
		}
	},
	"Shogun": {
		"description": "Masters of the blade and the shadows.",
		"stat_mods": {"SPD": 4, "PATK": 1},
		"abilities": {
			"Shadowfoot": "",
			"Assassinate": ""
		}
	},
	"Legion": {
		"description": "Disciplined knights sworn to honor and defense.",
		"stat_mods": {"PDEF": 3, "MDEF": 2},
		"abilities": {
			"Guardian": "",
			"Stalwart": ""
		}
	},
	"Storm": {
		"description": "Beings of raw elemental energy — wind, lightning, rain.",
		"stat_mods": {"MATK": 4, "SPD": 1},
		"abilities": {
			"Rain Dance": "",
			"Thunderbolt": ""
		}
	},
}

# --- Domain Utility Functions ---

func get_random_domain() -> String:
	var keys = DOMAIN_DATA.keys()
	return keys[randi() % keys.size()]

func get_domain_data(domain: String) -> Dictionary:
	if domain in DOMAIN_DATA:
		return DOMAIN_DATA[domain]
	return {}

func get_domain_stat_mods(domain: String) -> Dictionary:
	if domain in DOMAIN_DATA:
		return DOMAIN_DATA[domain]["stat_mods"]
	return {}
	
func get_domain_abilities(domain: String) -> Dictionary:
	if domain in DOMAIN_DATA:
		return DOMAIN_DATA[domain]["abilities"]
	return {}

func describe_domain(domain: String) -> void:
	if domain in DOMAIN_DATA:
		var data = DOMAIN_DATA[domain]
		print("%s Domain:" % domain)
		print("  %s" % data["description"])
		print("  Stat Mods: %s" % str(data["stat_mods"]))
		print("  Abilities: %s" % str(data["abilities"]))
	else:
		print("Unknown domain: %s" % domain)

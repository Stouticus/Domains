# res://scripts/utilities/domain_manager.gd
extends Node
class_name DomainManager

var domain_stats = {
	"Ninja": {"PATK":2, "MATK":1, "PDEF":1, "MDEF":1, "SPD":3, "HP":3},
	"Pirate": {"PATK":3, "MATK":1, "PDEF":2, "MDEF":1, "SPD":2, "HP":3},
	"Undead": {"PATK":1, "MATK":1, "PDEF":2, "MDEF":2, "SPD":1, "HP":4}
}

var domain_abilities = {
	"Ninja": ["Dodge","Assassinate"],
	"Pirate": ["Bleed","Double Strike"],
	"Undead": ["Regenerate","Undying"]
}

func get_base_stats(domain: String) -> Dictionary:
	return domain_stats.get(domain, {})

func get_abilities(domain: String) -> Array:
	return domain_abilities.get(domain, [])

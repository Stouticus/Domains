extends Node
class_name Member

var member_name: String = "New Member"
var level: int = 1
var rank: int = 1
var domain: String = ""
var stats: Dictionary = {
	"HP": 10,
	"PATK": 1,
	"MATK": 1,
	"PDEF": 1,
	"MDEF": 1,
	"SPD": 1
}
var health: int = 10

# Print basic info and full stat block
func print_info():
	print("- %s | Domain: %s | Rank: %d | Level: %d" % [member_name, domain, rank, level])
	print("  Stats:")
	for key in stats.keys():
		print("   %s | %d" % [key, stats[key]])
	print("  Current HP: %d" % health)

extends Node
class_name Team

@export var max_size: int = 5
var members: Array = []

func add_member(recruit: Recruit):
	var m = Member.new()
	m.member_name = recruit.name
	m.domain = recruit.domain
	m.rank = recruit.rank
	m.stats = recruit.base_stats.duplicate()
	m.health = recruit.base_stats.get("HP", 5)
	members.append(m)

func is_full() -> bool:
	return members.size() >= max_size

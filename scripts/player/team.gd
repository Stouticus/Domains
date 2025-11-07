extends Node
class_name Team

@export var max_size: int = 5
var members: Array = []

func add_member(recruit: Recruit):
	var m = Member.new()
	m.member_name = recruit.name
	m.domain1 = recruit.domain1
	m.domain2 = recruit.domain2
	m.level = recruit.level
	m.stats = recruit.base_stats.duplicate()
	m.health = recruit.base_stats.get("HP", 5)
	members.append(m)

func is_full() -> bool:
	return members.size() >= max_size
	
func get_level() -> int:
	if members.size() == 0:
		return 1

	var total_level := 0
	for m in members:
		if m.has_method("get_level"):
			total_level += m.level

	return int(round(total_level / float(members.size())))

/datum/job/civilian
	title = "Civilian"
	flag = CIVILIAN
	department_flag = STAVERY
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/civilian/get_access()
	minimal_access = list()	//See /datum/job/civilian/get_access()
	alt_titles = list("Alchemical Student","Novice Thaumaturge","Poritary Trainee")

	no_random_roll = 1 //Don't become assistant randomly

/datum/job/civilian/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	H.equip_or_collect(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_or_collect(new /obj/item/clothing/shoes/black(H), slot_shoes)
	H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	return 1

/datum/job/civilian/get_access()
	if(config.civilian_maint)
		return list(access_maint_tunnels)
	else
		return list()

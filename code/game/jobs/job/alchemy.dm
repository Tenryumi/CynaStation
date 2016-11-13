/datum/job/ca
	title = "Chief Alchemist"
	flag = CA
	department_flag = ALCHEMY
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the headmaster"
	selection_color = "#00e64d"
	idtype = /obj/item/weapon/card/id/cmo
	req_admin_notify = 1
	access = list(access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_paramedic, access_eva)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_paramedic)
	minimal_player_age = 7


	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/heads/cmo

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/heads/cmo(H), slot_ears)
		switch(H.backbag)
			if(2)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_or_collect(new /obj/item/clothing/under/rank/chief_medical_officer(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		//H.equip_or_collect(new /obj/item/device/pda/heads/cmo(H), slot_belt)
		H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/cmo(H), slot_wear_suit)
		H.put_in_hands(new /obj/item/weapon/storage/firstaid/regular(H))
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		if(H.backbag == 1)
			H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
		else
			H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
		return 1

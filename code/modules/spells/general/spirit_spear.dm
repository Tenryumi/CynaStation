/spell/general/spiritspear
	name = "Spirit Spear"
	abbreviation = "SS"
	desc = "This spell conjures a throwing spear into the user's hand, made from nothing more than the user's willpower."

	school = "evocation"
	charge_max = 100
	spell_flags = 0
	invocation = "NNGAA"
	invocation_type = SpI_SHOUT
	cooldown_min = 60

	level_max = list(Sp_TOTAL = 4, Sp_SPEED = 4, Sp_POWER = 0)

//The spear itself

/obj/item/weapon/gun/spiritspear
	name = "spirit spear"
	desc = "It glows softly in your hand. You can almost see through it..."
	density = 0
	anchored = 0
	force = 25
	throw_speed = 0
	throw_range = 0
	fire_sound = 'sound/weapons/und_spear_fire.ogg'
	fire_volume = 60
	attack_verb = list("charges", "stabs", "impales")
	slot_flags = null
	icon_state = "spear"
	item_state = "spear"
	advanced_tool_user_check = 0
	nymph_check = 0
	hulk_check = 0
	golem_check = 0
	w_class = W_CLASS_MEDIUM
	inhand_states = list("left_hand" = 'icons/mob/in-hand/left/undyne_spear.dmi', "right_hand" = 'icons/mob/in-hand/right/undyne_spear.dmi')

/obj/item/weapon/gun/spiritspear/Fire(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, params, reflex = 0, struggle = 0)
	if(M_CLUMSY in user.mutations)
		if(prob(50))
			to_chat(user, "<span class='danger'><b>You accidentally stab yourself!</b></span>")
			playsound(user.loc, 'sound/weapons/und_spear_hit.ogg', 50, 1)
			M.take_organ_damage(0,20)
			M.drop_item(src, force_drop = 1)
			qdel(src)
			return
	else
		playsound(user, fire_sound, fire_volume/5, 1)
		in_chamber.original = target
		in_chamber.forceMove(get_turf(user))
		in_chamber.starting = get_turf(user)
		in_chamber.shot_from = src
		user.delayNextAttack(4) // TODO: Should be delayed per-gun.
		in_chamber.silenced = silenced
		in_chamber.current = curloc
		in_chamber.OnFired()
		in_chamber.yo = targloc.y - curloc.y
		in_chamber.xo = targloc.x - curloc.x
		in_chamber.inaccurate = (istype(user.locked_to, /obj/structure/bed/chair/vehicle))

		if(params)
			var/list/mouse_control = params2list(params)
			if(mouse_control["icon-x"])
				in_chamber.p_x = text2num(mouse_control["icon-x"])
			if(mouse_control["icon-y"])
				in_chamber.p_y = text2num(mouse_control["icon-y"])

		spawn()
			if(in_chamber)
				in_chamber.process()
		sleep(1)
		in_chamber = null

		update_icon()

		user.update_inv_hand(user.active_hand)

/obj/item/weapon/gun/spiritspear/attack(mob/living/M as mob, mob/living/user as mob, def_zone)
	if (M == user && user.zone_sel.selecting == "mouth" && !mouthshoot)
		to_chat(M, "<span class='warning'>A TRUE WARRIOR NEVER GIVES IN!</span>")
		return



//Upon casting the spell

/spell/general/spiritspear/cast(var/mob/living/user/M as mob, mob/living/user as mob)
	if(M.active_hand = 0) //If our active hand isn't holding anything
		var/obj/item/weapon/gun/spiritspear/S = new(M)
			user.put_in_active_hand(S)
			S.alpha = 0
			animate(S, alpha = 255, time = 10)
			target.visible_message("<span class='danger'>An arcane spear appears in [target]'s hand!</span>", \
									"<span class='danger'>You conjure a spirit spear!</span>")
			playsound(user.loc, 'sound/weapons/und_spear_arm.ogg', 50, 1)
	else //If we're holding something in our active hand already
		to_chat("<span class='warning'>You need to empty your hand first!</span>")
		return 0


//PROJECTILE

/obj/item/projectile/spell_projectile/spear
	name = "spirit spear"
	icon_state = "spear"
	animate_movement = 2
	nodamage = 0

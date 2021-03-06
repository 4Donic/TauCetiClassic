//Helper object for picking dionaea (and other creatures) up.
/obj/item/weapon/holder
	name = "holder"
	desc = "You shouldn't ever see this."
	icon = 'icons/obj/objects.dmi'
	slot_flags = SLOT_HEAD

/obj/item/weapon/holder/New()
	..()
	SSobj.processing |= src

/obj/item/weapon/holder/Destroy()
	SSobj.processing.Remove(src)
	return ..()

/obj/item/weapon/holder/process()

	if(istype(loc,/turf) || !(contents.len))

		for(var/mob/M in contents)

			var/atom/movable/mob_container
			mob_container = M
			mob_container.forceMove(get_turf(src))
			M.reset_view()

		qdel(src)

/obj/item/weapon/holder/attackby(obj/item/weapon/W, mob/user)
	for(var/mob/M in src.contents)
		M.attackby(W,user)

/obj/item/weapon/holder/proc/show_message(message, m_type)
	for(var/mob/living/M in contents)
		M.show_message(message,m_type)

//Mob procs and vars for scooping up
/mob/living/var/holder_type

/mob/living/proc/get_scooped(mob/living/carbon/grabber)
	if(!holder_type || buckled || pinned.len)
		return
	var/obj/item/weapon/holder/H = new holder_type(loc)
	src.loc = H
	H.name = src.name
	H.attack_hand(grabber)

	to_chat(grabber, "You scoop up [src].")
	to_chat(src, "[grabber] scoops you up.")
	grabber.status_flags |= PASSEMOTES
	LAssailant = grabber
	return

//Mob specific holders.

/obj/item/weapon/holder/diona

	name = "diona nymph"
	desc = "It's a tiny plant critter."
	icon_state = "nymph"
	origin_tech = "magnets=3;biotech=5"

/obj/item/weapon/holder/drone

	name = "maintenance drone"
	desc = "It's a small maintenance robot."
	icon_state = "drone"
	origin_tech = "magnets=3;engineering=5"


/obj/item/weapon/holder/cat

	name = "cat"
	desc = "It's a cat. Meow."
	icon_state = "cat"
	origin_tech = null

/obj/item/weapon/holder/mouse
	name = "mouse"
	desc = "It's a small rodent."
	icon_state = "mouse_gray"
	origin_tech = null
	w_class = 1

/obj/item/weapon/holder/mouse/gray
	icon_state = "mouse_gray"

/obj/item/weapon/holder/mouse/white
	icon_state = "mouse_white"

/obj/item/weapon/holder/mouse/brown
	icon_state = "mouse_brown"

/obj/item/weapon/holder/monkey
	name = "monkey"
	desc = "It's a monkey. Ook."
	icon_state = "cat"
	origin_tech = null
	icon = 'icons/mob/monkey.dmi'
	icon_state = "monkey1"

/obj/item/weapon/holder/monkey/farwa
	name = "farwa"
	desc = "It's a farwa."
	icon_state = "tajkey1"

/obj/item/weapon/holder/monkey/stok
	name = "stok"
	desc = "It's a stok. stok."
	icon_state = "stokkey1"
	origin_tech = null

/obj/item/weapon/holder/monkey/neaera
	name = "neaera"
	desc = "It's a neaera."
	icon_state = "skrellkey1"
	origin_tech = null

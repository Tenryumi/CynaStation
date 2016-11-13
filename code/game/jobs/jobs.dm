var/const/ENGSEC			=(1<<0)

var/const/HEADMASTER			=(1<<0)
var/const/HP				=(1<<1)
var/const/WARDEN			=(1<<2)
var/const/DETECTIVE			=(1<<3)
var/const/PORITUS			=(1<<4)
var/const/THATUMCHIEF				=(1<<5)
var/const/THAUMATURGIST			=(1<<6)
var/const/ATMOSTECH			=(1<<7)
var/const/ROBOTICIST		=(1<<8)
var/const/AI				=(1<<9)
var/const/CYBORG			=(1<<10)
var/const/MOMMI				=(1<<11)
var/const/AUTOMATON		=(1<<12)
var/const/TINKERER			=(1<<13)


var/const/ALCHMAG			=(1<<1)

var/const/ARCHMAGWE				=(1<<0)
var/const/STUDENT			=(1<<1)
var/const/ALCHEMIST			=(1<<2)
var/const/CA				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
//var/const/PSYCHIATRIST		=(1<<7)
var/const/PARAMEDIC			=(1<<7)


var/const/CIVILIAN			=(1<<2)

var/const/OS				=(1<<0)
var/const/BARTENDER			=(1<<1)
var/const/BOTANIST			=(1<<2)
var/const/CHEF				=(1<<3)
var/const/JANITOR			=(1<<4)
var/const/LIBRARIAN			=(1<<5)
var/const/QUARTERMASTER		=(1<<6)
var/const/CARGOTECH			=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER			=(1<<9)
var/const/CHAPLAIN			=(1<<10)
var/const/CLOWN				=(1<<11)
var/const/MIME				=(1<<12)
var/const/ASSISTANT			=(1<<13)
var/const/TRADER			=(1<<14)


var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Headmaster",
	"Overseer",
	"Poritary Commander",
	"Chief Thaumaturgist",
	"Archmage",
	"Chief Alchemist",
)


var/list/thaumaturgy_positions = list(
	"Chief Thaumaturgist",
)


var/list/alchemy_positions = list(
	"Chief Alchemist",

)


var/list/magery_positions = list(
	"Archmage",
	"Student",
	"Demonologist",
)

//BS12 EDIT
var/list/stavery_positions = list(
	"Overseer",
)

var/list/trannelus_positions = list(
	"Master Trannelus",
)

var/list/poritary_positions = list(
	"Poritary Commander",
	"Poritus",
)

var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"pAI",
	"Mobile MMI"
)

var/list/misc_positions = list(
	"Trader",
)

/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)
			continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)
			continue
		if(J.title == job)
			titles = J.alt_titles

	return titles

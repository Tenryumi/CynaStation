var/const/ENGSEC			=(1<<0)

var/const/HEADMASTER			=(1<<0)
var/const/HP				=(1<<1)
var/const/PORITUS			=(1<<2)
var/const/THATUMCHIEF				=(1<<3)
var/const/THAUMATURGIST			=(1<<4)
var/const/AUTOMATON		=(1<<5)
var/const/TINKERER			=(1<<6)

var/const/CA	=(1<<0)
var/const/ALCHEMIST			=(1<<1)

var/const/ARCHMAGE				=(1<<0)
var/const/STUDENT			=(1<<1)
var/const/DEMONOLOGIST			=(1<<2)

var/const/STAVERY			=(1<<2)

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
var/const/CIVILIAN			=(1<<13)
var/const/TRADER			=(1<<14)


var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Headmaster",
	"Overseer",
)


var/list/thaumaturgy_positions = list(
)


var/list/alchemy_positions = list(

)


var/list/magery_positions = list(
)

//BS12 EDIT
var/list/stavery_positions = list(
	"Overseer",
)

var/list/trannelus_positions = list(
)

var/list/poritary_positions = list(
)

var/list/nonhuman_positions = list(
)

var/list/misc_positions = list(
)

/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in poritary_positions))

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

var/list/station_departments = list("Command", "Medical", "Engineering", "Science", "Security", "Cargo", "Stavery")

// The department the job belongs to.
/datum/job/var/department = null

// Whether this is a head position
/datum/job/var/head_position = 0

/datum/job/captain/department = "Command"
/datum/job/captain/head_position = 1

/datum/job/hop/department = "Stavery"
/datum/job/hop/head_position = 1

/datum/job/civilian/department = "Stavery"

/datum/job/bartender/department = "Stavery"

/datum/job/chef/department = "Stavery"

/datum/job/hydro/department = "Stavery"

/datum/job/janitor/department = "Stavery"

/datum/job/librarian/department = "Stavery"

/datum/job/lawyer/department = "Stavery"

/datum/job/chaplain/department = "Stavery"

/datum/job/clown/department = "Stavery"

/datum/job/mime/department = "Stavery"

/datum/job/qm/department = "Cargo"
/datum/job/qm/head_position = 1

/datum/job/cargo_tech/department = "Cargo"

/datum/job/mining/department = "Cargo"

/datum/job/chief_engineer/department = "Engineering"
/datum/job/chief_engineer/head_position = 1

/datum/job/engineer/department = "Engineering"

/datum/job/atmos/department = "Engineering"

/datum/job/cmo/department = "Medical"
/datum/job/cmo/head_position = 1

/datum/job/doctor/department = "Medical"

/datum/job/chemist/department = "Medical"

/datum/job/geneticist/department = "Medical"

/datum/job/psychiatrist/department = "Medical"

/datum/job/rd/department = "Science"
/datum/job/rd/head_position = 1

/datum/job/scientist/department = "Science"

/datum/job/roboticist/department = "Science"

/datum/job/hos/department = "Security"
/datum/job/hos/head_position = 1

/datum/job/warden/department = "Security"

/datum/job/detective/department = "Security"

/datum/job/officer/department = "Security"
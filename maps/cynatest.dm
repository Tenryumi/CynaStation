//**************************************************************
// Map Datum -- CynaStation
//**************************************************************

/datum/map/active
	nameShort = "cynatest"
	nameLong = "Cyna Test"
	map_dir = "cynatest"
	zLevels = list(
		/datum/zLevel/station,
		/datum/zLevel/centcomm,
		/datum/zLevel/space{
			name = "spaceOldSat" ;
			},
		/datum/zLevel/space{
			name = "derelict" ;
			},
		/datum/zLevel/mining,
		/datum/zLevel/space{
			name = "spacePirateShip" ;
			},
		)

////////////////////////////////////////////////////////////////
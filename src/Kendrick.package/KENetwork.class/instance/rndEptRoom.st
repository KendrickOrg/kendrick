as yet unclassified
rndEptRoom
	"This function will return a random node ID in the emptyRooms"
	|rand|
	rand := Random new.
	^ emptyRooms removeAt: (((rand next) * (emptyRooms size)) ceiling)
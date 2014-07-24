as yet unclassified
rndEmptyNode
	"This function will return a random node ID in the emptyRooms"
	|rand|
	rand := Random new.
	^ emptyNodes removeAt: (((rand next) * (emptyNodes size)) ceiling)
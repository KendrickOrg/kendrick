as yet unclassified
randRoom
	"This function will return a random node ID in the emptyRooms"
	|rand|
	rand := Random new.
	^ ((rand next) * (emptyRooms size)) ceiling
run
updateGenInfected: aNode
	| infectedNodes |
	infectedNodes := self infectedNeighborsOf: aNode.
	"TODO : Faire le calcul correct des génerations"
	aNode genInfected: (infectedNodes collect: [ :each | each genInfected ]) max +1
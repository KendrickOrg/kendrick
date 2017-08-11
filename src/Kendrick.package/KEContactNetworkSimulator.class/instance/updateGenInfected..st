run
updateGenInfected: aNode
	| infectedNodes |
	infectedNodes := self infectedNeighborsOf: aNode.
	aNode genInfected: (infectedNodes collect:[:each | each genInfected]) atRandom +1
run
updateGenInfected: aNode
	| infectedNodes |
	infectedNodes := network infectedNeighborsOf: aNode.
	aNode genInfected: (infectedNodes collect:[:each | each genInfected]) atRandom +1
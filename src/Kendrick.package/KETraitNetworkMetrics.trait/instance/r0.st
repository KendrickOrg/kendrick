metrics
r0
	"Return number of nodes of generation 2/ number of nodes of generation 3"

	| nodesGen2 nodesGen3 |
	nodesGen2 := self nodes select: [ :each | each genInfected == 2 ].
	nodesGen3 := self nodes select: [ :each | each genInfected == 3 ].
	nodesGen2 size == 0
		ifTrue: [ ^ Float nan ].
	^ (nodesGen3 size / nodesGen2 size) asFloat
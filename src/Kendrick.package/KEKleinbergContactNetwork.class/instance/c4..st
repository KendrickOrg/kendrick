metrics
c4: aNode
	"Return the number of triangle (cycle of length 3) starting from aNode"

	| pathTree cpt |
	cpt := 0.
	pathTree := OrderedCollection new.
	pathTree := self pathOfLength: 3 startingFrom: aNode.
	pathTree
		do: [ :eachPath | 
			| neighbors |
			neighbors := self neighborsOf: (eachPath at: 4).
			(neighbors includes: aNode)
				ifTrue: [ cpt := cpt + 1 ] ].
	^ cpt //2
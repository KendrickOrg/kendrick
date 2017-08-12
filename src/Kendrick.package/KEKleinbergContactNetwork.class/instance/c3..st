metrics
c3: aNode
	"Return the number of triangle (cycle of length 3) starting from aNode"

	| result pathTwo cpt |
	cpt := 0.
	result := OrderedCollection new.
	pathTwo := OrderedCollection new.
	pathTwo := self pathOfLength: 2 startingFrom: aNode.
	pathTwo
		do: [ :eachPath | 
			| neighbors result1 |
			result1 := OrderedCollection new.
			neighbors := self neighborsOf: (eachPath at: 3).
			(neighbors includes: aNode)
				ifTrue: [ cpt := cpt + 1 ] ].
	^ cpt//2
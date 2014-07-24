as yet unclassified
initLocation
	|location i mod sqrtNbInd|
	"Make sure that nbInd is a square number"
	sqrtNbInd := self gridWidth.
	location := (((1.0 to: sqrtNbInd by: 1.0) asArray)/sqrtNbInd) * surface.
	i := 1.
	location do: [ :x|
		location do: [ :y|
			i <= (population indList size) ifTrue: [ 
				(population indList at: i) location: (Array with: x with: y).
				i := i + 1.
				 ]
			 ]
		 ].
	mod := (self nodes size) - (sqrtNbInd raisedTo: 2).
	(mod > 0) ifTrue: [ 
		1 to: mod do: [ :k|
			|x y|
			x := (location last) + (1.0/sqrtNbInd).
			y := location at: k.
			(population indList at: (i + k - 1)) location: (Array with: x with: y)
			 ]
		 ]
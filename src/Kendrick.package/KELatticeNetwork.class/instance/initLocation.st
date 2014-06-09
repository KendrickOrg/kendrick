as yet unclassified
initLocation
	|location i mod|
	"Make sure that nbInd is a square number"
	sqrtNbInd := nbInd sqrt rounded.
	"(nbInd sqrt \\ 1) ~= 0 ifTrue: [ 
		nbInd := (nbInd sqrt rounded) raisedTo: 2.
		 ]."
	location := (((1.0 to: sqrtNbInd by: 1.0) asArray)/sqrtNbInd) * surface.
	i := 1.
	location do: [ :x|
		location do: [ :y|
			i <= (indList size) ifTrue: [ 
				(indList at: i) location: (Array with: x with: y).
				i := i + 1.
				 ]
			 ]
		 ].
	mod := nbInd - (sqrtNbInd raisedTo: 2).
	(mod > 0) ifTrue: [ 
		1 to: mod do: [ :k|
			|x y|
			x := (location last) + (1.0/sqrtNbInd).
			y := location at: k.
			(indList at: (i + k - 1)) location: (Array with: x with: y)
			 ]
		 ]
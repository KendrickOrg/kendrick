as yet unclassified
initLocation
	|location i|
	"Make sure that nbInd is a square number"
	(nbInd sqrt \\ 1) ~= 0 ifTrue: [ 
		nbInd := (nbInd sqrt rounded) raisedTo: 2.
		 ].
	location := (((1.0 to: (nbInd sqrt) by: 1.0) asArray)/(nbInd sqrt)) * surface.
	i := 1.
	location do: [ :x|
		location do: [ :y|
			(indList at: i) attributes at: #location put: (Array with: x with: y).
			i := i + 1.
			 ]
		 ]
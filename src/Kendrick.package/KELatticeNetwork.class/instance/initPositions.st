as yet unclassified
initPositions
	1 to: (self nodes size) do: [ :i| |x y|
		x := i\\(self gridWidth).
		y := i//(self gridWidth) + 1.
		x = 0 ifTrue: [ x := (self gridWidth). y := i//(self gridWidth) ].
		(self population individuals at: i) attributes at: #position put: (Array with: x with: y)
		 ]
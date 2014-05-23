as yet unclassified
launch
	"Initialize a graph that connect between individuals"
	|rand N|
	rand := Random new.
	N := 0.
	[ N < (contact * nbInd) ] whileTrue: [ 
		|i j edge|
		i := ((rand next) * nbInd) ceiling.
		j := ((rand next) * nbInd) ceiling.
		edge := Array with: i with: j.
		(i ~= j) & ((self checkEdge: edge) = 0) ifTrue: [ 
			N := N + 2.
			self with: edge weight: #contact value: 1
			 ]
	 ].
	^ self
	
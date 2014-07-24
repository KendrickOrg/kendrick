as yet unclassified
initNetwork
	"Initialize a graph that connect between individuals"
	|rand N|
	rand := Random new.
	N := 0.
	self initLocation.
	[ N < (numberOfContacts * (self nodes size)) ] whileTrue: [ 
		|i j edge|
		i := ((rand next) * (self nodes size)) ceiling.
		j := ((rand next) * (self nodes size)) ceiling.
		edge := Array with: i with: j.
		(i ~= j) & ((self checkEdge: edge) = 0) ifTrue: [ 
			N := N + 2.
			self with: edge weight: #contact value: 1
			 ]
	 ].
	"1 to: (nbInd-1) do: [ :i|
		(i+1) to: nbInd do: [ :j|
			|edge|
			edge := Array with: i with: j.
			self with: edge weight: #contact value: 1
			 ]
		 ]."
	self initContacts.
	^ self
	
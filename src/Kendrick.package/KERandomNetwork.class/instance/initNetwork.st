as yet unclassified
initNetwork
	"Initialize a graph that connect between individuals"
	|rand N|
	rand := Random new.
	N := 0.
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
	self networkOfIndividuals ifTrue: [ self initContacts ]
	
as yet unclassified
initNetwork
	self initPositions.
	1 to: (self nodes size) do: [ :i||j|
		j := i - (self gridWidth).
		(j > 0) ifTrue: [ self with: (Array with: i with: j) weight: #contact value: 1 ].
		((i \\ (self gridWidth)) ~= 1) ifTrue: [ 
			j := i - 1.
			self with: (Array with: i with: j) weight: #contact value: 1
			 ]
		 ].
	self networkOfIndividuals ifTrue: [ self initContacts ]
	
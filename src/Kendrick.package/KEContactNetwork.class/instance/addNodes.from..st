adding
addNodes: anArray from: population
	attribute = #status ifTrue: [ 
		population individuals do: [ :each|
			self addNode: { #status->(each currentStatus at: #status). #id->(each id) }
			 ]
	 ] ifFalse: [ super addNodes: anArray from: population ]
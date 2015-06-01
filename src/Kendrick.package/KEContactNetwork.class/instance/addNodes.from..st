as yet unclassified
addNodes: anArray from: population
	attribute = #status ifTrue: [ 
		1 to: population individuals size do: [ :i|
			|ind|
			ind := population individuals at: i.
			self addNode: { #status->(ind currentStatus at: #status). #id->(ind id) }
			 ]
	 ] ifFalse: [ super addNodes: anArray from: population ]
as yet unclassified
initIndividuals: aCollection in: pid
	indList := OrderedCollection new.
	aCollection do: [ :each|
		1 to: (#second value: each) do: [ :i|
			|ind|
			ind := KEIndividual new.
			ind currentStatus: (#first value: each).
			ind pid: (pid).
			ind id: ((indList size) + 1).
			indList add: ind.
			"nodes add: (KENetworkNode new)"
			 ]
		 ].
	self hasNetwork ifTrue: [ ^ self initNetworkNodes ].
	^ self
	

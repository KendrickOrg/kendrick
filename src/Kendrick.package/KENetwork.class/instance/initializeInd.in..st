as yet unclassified
initializeInd: aCollection in: pid
	indList := OrderedCollection new.
	aCollection do: [ :each|
		1 to: (#second value: each) do: [ :i|
			|ind|
			ind := KEIndividual new.
			ind currentStatus: (#first value: each).
			ind pid: (pid).
			ind id: i.
			indList add: ind.
			nodes add: (KENetworkNode new)
			 ]
		 ].
	^ self launch
	

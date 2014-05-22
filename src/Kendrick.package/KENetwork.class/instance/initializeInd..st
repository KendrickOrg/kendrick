as yet unclassified
initializeInd: aCollection
	indList := OrderedCollection new.
	aCollection do: [ :each|
		1 to: (#second value: each) do: [ :i|
			|ind|
			ind := KEIndividual new.
			ind attributes at: #currentStatus put: (#first value: each).
			indList add: ind.
			nodes add: (KENode new)
			 ]
		 ].
	^ self launch
	

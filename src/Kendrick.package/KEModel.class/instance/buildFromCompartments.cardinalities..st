as yet unclassified
buildFromCompartments: anArrayOfAssociation cardinalities: anArray
	|names expand keys|
	names := OrderedCollection new.
	anArrayOfAssociation do: [ :each|
		names add: (each value collect: [:v| ((each key)->v)])
		 ].
	expand := [ :prefix :list| 
		list isEmpty
		ifTrue: [ Array with: prefix ]
		ifFalse: [ |tail|
			tail := list allButFirst: 1.
			list first inject: #() into: [ :all :each|
				all, (expand value: (prefix copyWith: each) value: tail) ] ] ].
	keys := expand value: #() value: names.
	compartments := Dictionary new.
	1 to: keys size do: [ :i| compartments at: (Dictionary newFrom: (keys at: i)) put: (anArray at: i) ].
	self population compartments: compartments
	
	
	
	
	
	
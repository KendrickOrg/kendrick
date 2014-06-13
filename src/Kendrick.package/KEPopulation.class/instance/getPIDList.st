accessing
getPIDList
	"|builder|
	builder := KEPopulationBuilder new.
	^ builder getPIDListOf: self"
	|PIDList|
	PIDList := OrderedCollection new.
	(self isRoot and: [ (nodes size = 0) | self isAPopulationOfCompartments ]) ifTrue: [ ^ #(0) ].
	nodes do: [ :each|
		each isAPopulationOfCompartments 
		ifTrue: [ PIDList add: (each id asArray) ]
		ifFalse: [ PIDList addAll: each getPIDList ]
		 ].
	^ PIDList asArray
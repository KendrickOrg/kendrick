as yet unclassified
generateTransitionsFrom: t and: keys
	|result|
	result := OrderedCollection new.
	keys size = 0 
	ifTrue: [ result add: t ]
	ifFalse: [ 
		keys do: [ :k| 
			|tmp from to|
			tmp := k copy.
			t from = #empty
			ifTrue: [ from := #empty ]
			ifFalse: [ t from keysAndValuesDo: [ :kt :vt| tmp at: kt put: vt ]. from := tmp copy ].
			t to = #empty
			ifTrue: [ to := #empty ]
			ifFalse: [ t to keysAndValuesDo: [ :kt :vt| tmp at: kt put: vt ]. to := tmp copy ].
			result add: (KETransition from: from to: to probability: t probability)
		] ].
	^ result

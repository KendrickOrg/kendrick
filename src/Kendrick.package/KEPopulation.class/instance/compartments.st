adding
compartments
	(compartments isNil and: [ attributes isNotNil ]) ifTrue: [ 
		|names expand keys|
		names := OrderedCollection new.
		self relations do: [ :each|
			names add: ((attributes at: each) value collect: [ :v| (each->v) ]) 
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
		keys do: [ :each| compartments at: (Dictionary newFrom: each) put: 0 ]
	 ].
	^ compartments
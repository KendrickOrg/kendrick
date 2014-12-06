as yet unclassified
birthTransitions
	birthTransitions ifNil: [ 
		birthTransitions := OrderedCollection new.
		1 to: model transitions size do: [ :i| |tr| tr := model transitions at: i.
			tr from = #empty ifTrue: [ 
				tr rate ifNotNil: [ tr rate: (tr rate remove: (KEVariable new symbol: #N)) ].
				birthTransitions add: (tr->i) ] ]
		 ].
	^ birthTransitions 
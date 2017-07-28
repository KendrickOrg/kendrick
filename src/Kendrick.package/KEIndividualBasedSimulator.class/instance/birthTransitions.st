accessing
birthTransitions
	birthTransitions ifNil: [ 
		birthTransitions := OrderedCollection new.
		1 to: model transitions size do: [ :i| |tr| tr := model transitions at: i.
			((tr from at: #status) = #empty) ifTrue: [ 
				birthTransitions add: (tr->i) ] ]
		 ].
	^ birthTransitions 
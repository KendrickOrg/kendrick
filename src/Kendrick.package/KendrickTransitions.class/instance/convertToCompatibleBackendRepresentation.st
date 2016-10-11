as yet unclassified
convertToCompatibleBackendRepresentation

	|transitions currentTransition|

	transitions := OrderedCollection new.
	currentTransition := nil.

	eqAsSymExpr  do: [ :token | 
		(token = #--> or: [ token = #-- ])
			ifTrue: [  
				"do nothing"
			] ifFalse: [ 
				token = #'.'
					ifTrue: [ transitions add: currentTransition. currentTransition := nil ]
					ifFalse: [ 
						currentTransition = nil 
							ifTrue: [ currentTransition := token ]
							ifFalse: [ currentTransition := currentTransition -> token ]  
					]
			]
	].

	^ transitions 

	
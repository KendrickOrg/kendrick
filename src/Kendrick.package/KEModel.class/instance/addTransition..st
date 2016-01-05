as yet unclassified
addTransition: aTransition
	"Allowing to define a basic transition et generate automatically a set of equivalent transitions for compartments with the same status"
	"|names|
	aTransition from = #empty 
	ifTrue: [ names := initCompartments keys select: [ :k| k associations includesAll: aTransition to associations ] ]
	ifFalse: [ names := initCompartments keys select: [ :k| k associations includesAll: aTransition from associations ] ].
	names do: [ :k| |tmp from to|
		tmp := k copy.
		aTransition from = #empty 
		ifTrue: [ from := #empty ]
		ifFalse: [ tmp at: #status put: (aTransition from at: #status). from := tmp copy ].
		aTransition to = #empty
		ifTrue: [ to := #empty ]
		ifFalse: [ tmp at: #status put: (aTransition to at: #status). to := tmp copy ].
		transitions add: (KETransition new from: from; to: to; probability: aTransition probability)
	]"
	transitions add: aTransition 
	
as yet unclassified
runtimeExpr
	runtimeExpr ifNil: [ 
		|eventList eq|
		runtimeExpr := Dictionary new.
		eventList := self arguments at: #1.
		eq := self arguments at: #2.
		eventList keysDo: [ :each|
			runtimeExpr at: each put: (OrderedCollection new).
			 ].
		eventList keysAndValuesDo: [ :pid :events|
			events do: [ :each|
				(each compartment = eq variable symbol) 
				ifTrue: [ (runtimeExpr at: pid) add: each ]
				 ]
			 ]
		 ].
	^ runtimeExpr
as yet unclassified
runtimeExpr
	runtimeExpr ifNil: [ 
		|eventList eq|
		runtimeExpr := OrderedCollection new.
		eventList := self arguments at: #1.
		eq := self arguments at: #2.
		eventList do: [ :each|
			(each fromStatus = eq variable symbol) | (each toStatus = eq variable symbol) ifTrue: [ runtimeExpr add: each ]
			 ]
		 ].
	^ runtimeExpr
	
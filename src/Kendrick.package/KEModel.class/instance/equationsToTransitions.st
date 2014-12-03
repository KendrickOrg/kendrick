as yet unclassified
equationsToTransitions
	|eGenerator events|
	eGenerator := KEEventGenerator new.
	events := eGenerator generateEvents: self.
	events do: [ :each| |names from to|
		each fromStatus = #empty ifTrue: [ 
			from := #empty.
			names := self atCompartment: (Dictionary newFrom: {(#status->each toStatus)})
			 ].
		each toStatus = #empty ifTrue: [ 
			to := #empty.
			names := self atCompartment: (Dictionary newFrom: {(#status->each fromStatus)})
			 ].
		((each fromStatus ~= #empty) and: (each toStatus ~= #empty)) ifTrue: 
		[ names := self atCompartment: (Dictionary newFrom: {(#status->each fromStatus)}) ].
		names isDictionary 
		ifFalse: [ 
			from ifNil: [ from := (Dictionary newFrom: {(#status->each fromStatus)}) ].
			to ifNil: [ to := (Dictionary newFrom: {(#status->each toStatus)}) ].
			transitions add: (KETransition from: from to: to rate: each rate ) ]
		ifTrue: [ 
			names keys do: [ :k|
				(from ~= #empty ) ifTrue: 
					[ from := ([|tmp| tmp := k copy. tmp at: #status put: each fromStatus. tmp] value) ].
				(to ~= #empty ) ifTrue: 
					[ to := ([|tmp| tmp := k copy. tmp at: #status put: each toStatus. tmp] value) ].
				transitions add: (KETransition from: from to: to rate: each rate subPopulation: k)
				 ]
			 ]
		 ]


as yet unclassified
generateMovementEvents
	(model population atParameter: #movement) ifNotNil: [ 
		|movementEvents N|
		movementEvents := Dictionary new.
		N := model PIDList size.
		model PIDList do: [ :pid| movementEvents at: pid put: (OrderedCollection new) ].
		model compartmentSymbols keys do: [ :each|
			1 to: (N-1) do: [ :i|
				(i+1) to: N do: [ :j| |events|
					events := self createMovementEvent: each from: (model PIDList at: i) to: (model PIDList at: j).
					events do: [ :event|
						(movementEvents at: (event fromStatus)) add: event
						 ]
					 ]
				 ]
			 ].
		^ movementEvents
		 ].
	^ nil
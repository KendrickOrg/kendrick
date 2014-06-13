accessing
generateMovementEvents
	(model population atParameter: #movement) ifNotNil: [ |movementEvents N|
		movementEvents := Dictionary new.
		N := model PIDList size.
		model PIDList do: [ :aPID|
			movementEvents at: aPID put: (OrderedCollection new)
			 ].
		model compartmentSymbols keys do: [ :each|
			1 to: (N-1) do: [ :i|
				(i+1) to: N do: [ :j| |events|
					events := self createMovementEvent: each from: (model PIDList at: i) to: (model PIDList at: j).
				(movementEvents at: (model PIDList at: i)) addAll: events.
				(movementEvents at: (model PIDList at: j)) addAll: events.
				 ]
			 ]
		 ].
		^ movementEvents
		 ].
	^ nil
	
	
	
as yet unclassified
generateMovementEvents
	(model population atParameter: #movement) ifNotNil: [ 
		|movementEvents N|
		movementEvents := OrderedCollection new.
		N := model PIDList size.
		model compartmentSymbols keys do: [ :each|
			1 to: (N-1) do: [ :i|
				(i+1) to: N do: [ :j| |events|
					events := self createMovementEvent: each from: (model PIDList at: i) to: (model PIDList at: j).
					movementEvents addAll: events
					 ]
				 ]
			 ].
		^ movementEvents
		 ].
	^ nil
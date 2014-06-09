as yet unclassified
generateMovementEvents
	(model population atParameter: #movement) ifNotNil: [ 
		|moveEvents N|
		moveEvents := Dictionary new.
		N := model PIDList size.
		model PIDList do: [ :pid|
			moveEvents at: pid put: (OrderedCollection new) ].
		1 to: (N-1) do: [ :i| 
			(i+1) to: N do: [ :j| |events|
				events := self createMovementEvent: nil from: (model PIDList at: i) to: (model PIDList at: j).
				(moveEvents at: (model PIDList at: i)) addAll: events.
				(moveEvents at: (model PIDList at: j)) addAll: events.	
				]
			].
		^ moveEvents
		 ].
	^ nil
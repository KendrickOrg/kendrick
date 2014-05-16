as yet unclassified
execute
	|solver eventList movementEventList|
	eventList := self generateEvents.
	movementEventList := self generateMovementEvents.
	eventList := eventList select: [ :each|each hasInterPopInteraction ].
	model equations do: [ :each|
		each findInterEvents: eventList.
		movementEventList ifNotNil: [ each findMovementEvents: movementEventList ]
		 ].
	algorithm = #RK4 ifTrue: [
		solver := RK4Solver new.
		solver xn: tMax.
		solver x0: tMin.
		solver step: step.
		data := solver solve: model.
		]
	
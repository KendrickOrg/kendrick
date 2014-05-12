as yet unclassified
execute
	|solver eventList|
	eventList := self generateEvents.
	eventList := eventList select: [ :each|each hasInterPopInteraction ].
	model equations do: [ :each|
		each findEventHasInterPopInteraction: eventList.
		 ].
	algorithm = #RK4 ifTrue: [
		solver := RK4Solver new.
		solver xn: tMax.
		solver x0: tMin.
		solver step: step.
		data := solver solve: model.
		].
	^ data
	
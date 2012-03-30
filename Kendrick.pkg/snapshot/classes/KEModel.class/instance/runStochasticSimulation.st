
!KEModel methodsFor: 'as yet unclassified'!
runStochasticSimulation

| eventList rateTotal  |
eventList := self events.

rateTotal := 0.
eventList do:[:each | (each rate) evaluateWithModel:self ].! !

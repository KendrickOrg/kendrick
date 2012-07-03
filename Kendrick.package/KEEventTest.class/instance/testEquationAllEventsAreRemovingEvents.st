tests
testEquationAllEventsAreRemovingEvents

| didt |
didt := 'I:t=-beta*S*I-gamma*I' parseAsAnEquation.
(didt generateEvents) do:[:each | self assert: true equals: (each isRemovingOneIndividualFrom:#I).
	].
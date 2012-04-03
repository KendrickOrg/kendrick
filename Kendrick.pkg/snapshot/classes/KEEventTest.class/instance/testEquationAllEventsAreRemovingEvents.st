
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationAllEventsAreRemovingEvents

| e |
e := 'I:t=-beta*S*I-gamma*I' parseAsODEEquation.
(e events) do:[:each | self assert: true equals: (each isRemovingOneIndividualFrom:#I)].! !

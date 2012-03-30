
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationAllEventsAreRemovingEvents

| e |
e := PPODEParser parse: 'I:t=-beta*S*I-gamma*I'.
(e events) do:[:each | self assert:(each isRemovingOneIndividualFrom:#I) equals: true].! !

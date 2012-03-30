
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationAllEventsAreAddingEvents

| e |
e := PPODEParser parse: 'I:t=beta*S*I+gamma*I'.
(e events) do:[:each |  self assert:(each isAddingOneIndividualFrom:#I) equals: true].! !

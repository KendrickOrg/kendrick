
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationAllEventsArePositive

| e |
e := PPODEParser parse: 'I:t=beta*S*I+gamma*I'.
(e events) do:[:each | self assert:(each rate sign) equals:1].! !


!KEEventTest methodsFor: 'as yet unclassified'!
testEquationHasTwoEvents

| e |
e := PPODEParser parse: 'I:t=beta*S*I-gamma*I'.
self assert:(e events size) equals:2! !

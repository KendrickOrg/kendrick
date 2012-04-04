
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationHasOneEvent

| equation |
equation := PPODEParser parse:'S:t=beta*S*I'.
self assert:(equation generateEvents size) equals:1! !

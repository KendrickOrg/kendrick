
!KEEventTest methodsFor: 'as yet unclassified'!
testEventsWithOppositeRate

|  e1 e2 si opMul varS varI varBeta minusBetaSI betaSI beta  listEvents opMin |
e1 := KEEvent new.
e2 := KEEvent new.

si := KEBinaryExpression new.
opMul := (KEOperator new) symbol:#*.
opMin := (KEOperator new) symbol:#-.
varS := (KEVariable new) symbol:#S.
varI := (KEVariable new) symbol:#I.
varBeta := (KEVariable new) symbol:#beta.
minusBetaSI := (KEUnaryExpression new).
si op:opMul; leftHandSide: varS; rightHandSide: varI.
betaSI := KEBinaryExpression new.
betaSI op:opMul; leftHandSide: beta; rightHandSide: si. 
minusBetaSI op:opMin ; expression: betaSI..

e1 rate: minusBetaSI.
e2 rate: betaSI.

listEvents := Bag new.
listEvents add: e1.
self assert: (e2 hasAnEventWithOppositeRateIn: listEvents) equals: true.! !

as yet unclassified
testEventsWithOppositeRate

|  e1 e2 si s i beta minusBetaSI betaSI listEvents |
e1 := KEEvent new.
e2 := KEEvent new.

s := (KEVariable new) symbol: #S.
i := (KEVariable new) symbol: #I.
beta := (KEVariable new) symbol:#beta.

minusBetaSI := (KEUnaryExpression new).
si := KEBinaryExpression new.
si op: #*; leftHandSide: s; rightHandSide: i.
betaSI := KEBinaryExpression new.
betaSI op:#*; leftHandSide: beta; rightHandSide: si. 
minusBetaSI op:#- ; expression: betaSI..

e1 rate: minusBetaSI normalize.
e2 rate: betaSI normalize.

listEvents := Bag new.
listEvents add: e1.
self assert: true equals: (e2 hasAnEventWithOppositeRateIn: listEvents)
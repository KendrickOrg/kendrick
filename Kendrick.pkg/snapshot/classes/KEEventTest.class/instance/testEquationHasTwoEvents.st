
!KEEventTest methodsFor: 'as yet unclassified'!
testEquationHasTwoEvents

| equation |
equation := 'I:t=beta*S*I-gamma*I' parseAsODEEquation.
self assert: (equation generateEvents size) equals: 2! !

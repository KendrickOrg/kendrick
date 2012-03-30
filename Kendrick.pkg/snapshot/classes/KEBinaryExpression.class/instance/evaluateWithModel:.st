
!KEBinaryExpression methodsFor: 'as yet unclassified'!
evaluateWithModel:m

| e1 e2 |
e1 := leftHandSide evaluateWithModel:m..
e2 := rightHandSide evaluateWithModel:m.

(op symbol value = '+') ifTrue:[
		^e1+e2].
(op symbol value = '*') ifTrue:[
		^e1*e2]! !

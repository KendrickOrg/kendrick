
!KEBinaryExpression methodsFor: 'as yet unclassified'!
evaluateWithModel:m

| e1 e2 |
e1 := leftHandSide evaluateWithModel:m..
e2 := rightHandSide evaluateWithModel:m.

(op = #+) ifTrue:[
		^e1+e2].
(op = #*) ifTrue:[
		^e1*e2]! !

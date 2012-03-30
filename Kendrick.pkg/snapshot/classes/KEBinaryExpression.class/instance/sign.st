
!KEBinaryExpression methodsFor: 'as yet unclassified'!
sign

(op symbol value = '*') ifTrue: [^(rightHandSide sign) * (leftHandSide sign)] ifFalse:[^0]! !

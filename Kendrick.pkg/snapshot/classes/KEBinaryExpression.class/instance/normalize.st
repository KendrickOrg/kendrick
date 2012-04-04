
!KEBinaryExpression methodsFor: 'as yet unclassified'!
normalize

"If the expression is negative, put the minus on the top"

|l1 l2 k | 
l1 := leftHandSide normalize.
l2 := rightHandSide normalize.

l1 isUnaryExpression ifTrue:[
	l2 isUnaryExpression ifTrue:[
		self leftHandSide: l1 expression.
		self rightHandSide: l2 expression.
		^self
		]
	ifFalse:[
		k := KEUnaryExpression new.
		k op:#-.
		self leftHandSide: l1 expression.
		self rightHandSide: l2.
		k expression: self.
		^k	
		].
	].

l2 isUnaryExpression ifTrue:[
		k := KEUnaryExpression new.
		k op:#-.
		self leftHandSide: l1.
		self rightHandSide: l2 expression.
		k expression: self.
		^k	
	].! !

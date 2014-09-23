acessing
remove: aVariable
	|new|
	new := self copy.
	aVariable symbol = self variable 
	ifTrue: [ 
		new couplingExpression: (self couplingExpression).
		new variable: nil
		 ]
	ifFalse: [ 
		new couplingExpression: (self couplingExpression remove: aVariable).
		new variable: self variable
		 ].
	^ new
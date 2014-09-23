acessing
= anExpression
	anExpression isCouplingExpression ifTrue: [  
		^ (self couplingExpression = anExpression couplingExpression) &
		  (self couplingParameter = anExpression couplingParameter) &
		  (self variable = anExpression variable)
		].
	^ false
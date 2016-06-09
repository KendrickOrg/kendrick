as yet unclassified
from: firstCompartment to: secondCompartment probability: aBlockOrAnExpression
	|prob|
	prob := aBlockOrAnExpression.
	aBlockOrAnExpression isString ifTrue: [ prob := aBlockOrAnExpression parseAsAnExpression ].
	^ self new
		from: firstCompartment ;
		to: secondCompartment ;
		probability: prob
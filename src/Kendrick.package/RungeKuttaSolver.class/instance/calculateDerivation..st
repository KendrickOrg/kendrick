as yet unclassified
calculateDerivation: model

| nbOfExpression dydx i |
nbOfExpression := listOfEquations size.
dydx := Array new: nbOfExpression.
i := 1.
listOfEquations do:[:each| 
	model eqIdVariable: (each idVariable).
	model eqIdValue: (each eqIndex).
	dydx at: i put: ((each expression) evaluateWithModel: model).
	i := i + 1.
	].
^dydx







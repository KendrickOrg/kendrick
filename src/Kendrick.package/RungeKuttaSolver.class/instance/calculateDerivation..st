as yet unclassified
calculateDerivation: model

| nbOfExpression dydx i |
nbOfExpression := listOfEquations size.
dydx := Array new: nbOfExpression.
i := 1.
listOfEquations do:[:each| 
	 dydx at: i put: ((each expression) evaluateWithModel: model).
	 i := i + 1.
	].

^dydx.







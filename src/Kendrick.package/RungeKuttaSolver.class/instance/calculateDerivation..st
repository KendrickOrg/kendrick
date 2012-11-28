as yet unclassified
calculateDerivation: model

| nbOfExpression dydx i |
nbOfExpression := equations size.
dydx := Array new: nbOfExpression.
i := 1.
equations do:[:each| 
	 dydx at: i put: ((each expression) evaluateWithModel: model).
	 i := i + 1.
	].
^dydx







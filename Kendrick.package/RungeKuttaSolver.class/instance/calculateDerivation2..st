as yet unclassified
calculateDerivation2: model

| nbOfExpression dydx id |
nbOfExpression := listOfEquations size.
dydx := Array new: nbOfExpression.
id := 1.
listOfEquations do:[:each| 
	"Update equation index variable and equation index value of each equation for the model"
	model eqIdVariable: (each idVariable).
	model eqIdValue: (each eqIndex).
	dydx at: id put: ((each expression) evaluateWithModel: model).
	id := id+ 1.	
	].
"self halt."
^dydx.




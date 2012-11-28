as yet unclassified
calculateDerivation2

| nbOfExpression  id derivativeResults |
nbOfExpression := equations size.
derivativeResults := Array new: nbOfExpression.
id := 1.
equations do:[:each| 
	"Update equation index variable and equation index value of each equation for the model"
	model indexName: (each idVariable).
	model eqIdValue: (each eqIndex).
	derivativeResults at: id put: (each evaluateWithModel: model).
	id := id+ 1.	
	].
^derivativeResults

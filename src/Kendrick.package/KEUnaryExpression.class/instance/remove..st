as yet unclassified
remove: aVariable
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	|new|
	new := (KEUnaryExpression new) op: #-.
	new expression: (expression remove: aVariable).
	^ new
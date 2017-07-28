evaluating
removeIndexedVariable
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"
	|new|
	new := self copy.
	new expression: (expression removeIndexedVariable).
	^ new
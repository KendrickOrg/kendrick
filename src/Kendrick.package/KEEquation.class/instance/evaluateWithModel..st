as yet unclassified
evaluateWithModel: model
	|result|
	result := self expression evaluateWithModel: model.
	"self rtExprImpls do: [ :each|
		result := result + (each evaluateWithModel: model)
		 ]."
	^ result
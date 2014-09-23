as yet unclassified
evaluateWithModel: model
	|r|
	r := (self evaluateInterRate: model) + (self evaluateRate: model).
	^ r
accessing
evaluateWithModel: model
	effectBuilder arguments at: #model put: model.
	^ effectBuilder evaluate: self.
	
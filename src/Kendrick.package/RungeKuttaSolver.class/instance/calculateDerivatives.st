as yet unclassified
calculateDerivatives
	^ equations collect: [ :each | each evaluateWithModel: model ]
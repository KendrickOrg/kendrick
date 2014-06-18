as yet unclassified
evaluateWithModel: aModel
	aModel eqIdVariable: (self eqIndexVar).
	aModel eqIdValue: (self eqIndex).
	self rateValue: ((self rate evaluateWithModel: aModel) abs).
	^self rateValue.

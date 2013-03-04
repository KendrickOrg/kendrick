as yet unclassified
evaluateWithModel: aModel

"Modify this function for the case of equation S[i]:t = expression"
(self eqIndex = -1) ifTrue: [
	self rateValue: ((self rate evaluateWithModel: aModel) abs).
	^ self rateValue] ifFalse: [
	aModel eqIdVariable: (self eqIndexVar).
	aModel eqIdValue: (self eqIndex).
	self rateValue: ((self rate evaluateWithModel: aModel) abs).
	^self rateValue.
	]

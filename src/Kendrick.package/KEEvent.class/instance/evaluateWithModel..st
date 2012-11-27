as yet unclassified
evaluateWithModel: aModel
	"Modify this function for the case of equation S[i]:t = expression"

	self eqIndex == -1
		ifTrue: [ rateValue := (self rate evaluateWithModel: aModel) abs ]
		ifFalse: [ 
			aModel indexName: self eqIndexVar.
			aModel eqIdValue: self eqIndex.
			rateValue := (self rate evaluateWithModel: aModel) abs ].
	^ rateValue
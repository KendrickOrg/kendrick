as yet unclassified
generateTensorSum: aTransitionList
	|remainingMatrix|
	remainingMatrix := self remainingMatrixAfterProjecting: aTransitionList.
	self transitions: (self generateSum: (self project: aTransitionList)).
	^ super generateTensorSum: remainingMatrix
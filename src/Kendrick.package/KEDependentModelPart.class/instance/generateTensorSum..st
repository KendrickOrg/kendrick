operators
generateTensorSum: arg1
	| tmp1 |
	tmp1 := self remainingMatrixAfterProjecting: arg1.
	self transitions: (self generateSum: (self project: arg1)).
	^ super generateTensorSum: tmp1
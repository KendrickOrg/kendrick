as yet unclassified
applyGraph: model
	|adapter|
	adapter := KECouplingAdapter new.
	adapter atArgument: #graph put: self.
	adapter adaptTo: model
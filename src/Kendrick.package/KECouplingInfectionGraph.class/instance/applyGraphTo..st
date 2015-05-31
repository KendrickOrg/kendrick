as yet unclassified
applyGraphTo: model
	|adapter|
	adapter := KECouplingAdapter new.
	adapter atArgument: #graph put: self.
	adapter adaptTo: model
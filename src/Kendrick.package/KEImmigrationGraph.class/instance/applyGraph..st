as yet unclassified
applyGraph: model
	|adapter|
	adapter := KEImmigrationAdapter new.
	adapter atArgument: #graph put: self.
	adapter adaptTo: model
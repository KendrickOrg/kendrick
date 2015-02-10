as yet unclassified
applyGraphTo: model
	|adapter|
	adapter := KEImmigrationAdapter new.
	adapter atArgument: #graph put: self.
	adapter adaptTo: model
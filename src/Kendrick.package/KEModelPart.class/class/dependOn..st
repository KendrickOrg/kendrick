as yet unclassified
dependOn: arg1
	| tmp1 |
	tmp1 := KEDependentModelPart new.
	tmp1 attributes: arg1 attributes.
	^ tmp1
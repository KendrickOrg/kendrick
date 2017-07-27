as yet unclassified
extends: arg1
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 clones: arg1.
	^ tmp1
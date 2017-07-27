as yet unclassified
new: arg1
	| tmp1 |
	tmp1 := KECodeGenerator new.
	arg1 = #CPP
		ifTrue: [ tmp1 visitor: KECPPVisitor new ].
	^ tmp1
as yet unclassified
new: aGPL
	|generator|
	generator := KECodeGenerator new.
	aGPL = #CPP ifTrue: [ generator visitor: (KECPPVisitor new) ].
	
	^ generator
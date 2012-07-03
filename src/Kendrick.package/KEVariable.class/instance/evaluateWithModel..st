as yet unclassified
evaluateWithModel: m
|x|
x := m atParameter:symbol.
x ifNil:[
	((symbol value) = #t) ifTrue: [^(m timeValue)].
	^ (m atCompartment: symbol) numberOfIndividuals.
	].
^x 

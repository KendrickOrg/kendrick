as yet unclassified
evaluateWithModel: m
|x|
x := m atParameter:symbol.
x ifNotNil: [	
	x isNumber ifTrue: [^x].
	symbol = (m eqIdVariable) ifTrue: [x:=(m eqIdValue)] ifFalse: [symbol = (m fnIdVariable) ifTrue: [x:=(m fnIdValue)]]		
	].
x ifNil:[
	((symbol value) = #t) ifTrue: [^(m timeValue)].
	^ ((m atCompartment: symbol) numberOfIndividuals) at: 1.
	].
^x 

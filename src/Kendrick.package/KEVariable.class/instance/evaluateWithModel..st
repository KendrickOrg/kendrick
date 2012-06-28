as yet unclassified
evaluateWithModel: m
|x|
x := m atParameter:symbol.
x ifNotNil: [
	x isNumber ifFalse: [
		symbol = (m eqIdVariable) ifTrue: [x:=(m eqIdValue)] ifFalse: [symbol = (m fnIdVariable) ifTrue: [x:=(m fnIdValue)] ifFalse: [x:=nil]]		
		]
	].
x ifNil:[
	((symbol value) = #t) ifTrue: [^(m timeValue)].
	^ (m atCompartment: symbol) numberOfIndividuals.
	].
^x 

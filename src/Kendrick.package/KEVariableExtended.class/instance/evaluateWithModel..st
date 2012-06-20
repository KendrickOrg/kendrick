as yet unclassified
evaluateWithModel: m
|x|
(m atParameter: index1) ifNil: [
	"index1 is a number, ex: beta[1]"
	index1 := (index1 asNumber).
	index2 = -1 ifTrue: [x := (m atParameter:symbol at: index1)] ifFalse: [
		(m atParameter: index2) ifNil: [
			index2 := (index2 asNumber).
			x := (m atParameter:symbol at: index1 at: index2)]
		].		
	] ifNotNil: [
		"index1 is not a number but a variable, ex: beta[j]"
		index1 = (m eqIdVariable) ifTrue: [
			index2 = -1 ifTrue: [
				x := (m atParameter: symbol at: (m eqIdValue)).				
			] ifFalse: [
				index2 = (m fnIdVariable) ifTrue: [
					x := (m atParameter: symbol at: (m eqIdValue) at: (m fnIdValue)).
				]				
			].
			x ifNil:[
				((symbol value) = #t) ifTrue: [x := (m timeValue)] ifFalse: [
				x := ((m atCompartment: symbol) numberOfIndividuals) at: (m eqIdValue)].
			]
		].
		index1 = (m fnIdVariable) ifTrue: [
			x := (m atParameter: symbol at: (m fnIdValue)).	
			x ifNil: [
				((symbol value) = #t) ifTrue: [x := (m timeValue)] ifFalse: [
				x:=((m atCompartment: symbol) numberOfIndividuals) at: (m fnIdValue)]
			]	
		]
	].	
	"Transcript show: (self symbol).
	Transcript show: (self index1).
	Transcript show: (self index2).
	Transcript show: x;cr."
^x 
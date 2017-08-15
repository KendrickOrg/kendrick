private
getIndexedValuesFrom: indexValues at: aModel with: strSymbol
	indexValues size = 0 
	ifTrue: [ ^(self getValueFromCompartmentsName: strSymbol at: aModel) ]
	ifFalse: [  
		|count temp arr attribute level|
		arr := indexValues at: 1.
		level := 0.
		level := strSymbol occurrencesOf: $#.
		"level := level - 1."
		attribute := (aModel attributes) at: ((aModel attributes) keys at: level).
		temp := Array new: (arr size).
		count := 1.
		arr do: [ 
			:each|
			|t newIndexValues races|
			newIndexValues := indexValues copy.
			races := attribute at: count.
			races := strSymbol , races , '#'.
			newIndexValues removeAtIndex: 1.
			t := self getIndexedValuesFrom: newIndexValues at: aModel with: races.
			temp at: count put: t.
			count := count + 1.
			 ].
		^temp.
		]."endof ifFalse: ["  
	^nil.

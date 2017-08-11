private
getIndexedValuesFrom: indexValues at: aModel with: strSymbol
	indexValues isEmpty
	ifTrue: [ 
		|result|
		result := (self getValueFromCompartmentsName: strSymbol at: aModel).
		result isArray ifTrue: [ ^(result at: (result size)). ].
		^result. 
		]
	ifFalse: [  
		|count temp arr attribute level|
		arr := indexValues at: 1.
		level := strSymbol occurrencesOf: $#.
		
		attribute := (aModel attributes) at: ((aModel attributes) keys at: level).
		temp := Array new: (arr size).
		count := 1.
		arr do: [ 
			:each|
			|t newIndexValues races|
			newIndexValues := indexValues copy.
			races := strSymbol , (attribute at: count) , '#'.
			newIndexValues removeAtIndex: 1.
			t := self getIndexedValuesFrom: newIndexValues at: aModel with: races.
			temp at: count put: t.
			count := count + 1.
			 ].
		^temp.
		]."endof ifFalse: ["  
	^nil.

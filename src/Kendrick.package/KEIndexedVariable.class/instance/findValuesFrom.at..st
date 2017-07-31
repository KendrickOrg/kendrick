private
findValuesFrom: indexValues at: model
	|strSymbol|
	strSymbol := '#' , symbol , '#'.
	^(self getIndexedValuesFrom: indexValues at: model with: strSymbol ).
	"| count temp arr attribute |
	arr := indexValues at: 1.
	attribute := (model attributes) at: #species.
	temp := Array new: (indexValues size).
	count := 1.
	arr do: [ 
		:each|
		|t newIndexValues race|
		newIndexValues := indexValues copy.
		race := attribute at: count.
		race := '#' , symbol , '#' , race , '#'.
		newIndexValues removeAtIndex: 1.
		t := self getIndexedValuesFrom: newIndexValues at: model with: race.
		temp at: count put: t.
		count := count + 1.
		 ].
	^temp."
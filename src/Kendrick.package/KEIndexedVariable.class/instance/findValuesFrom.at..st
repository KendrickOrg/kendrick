private
findValuesFrom: indexValues at: model

	|strSymbol|
	strSymbol := '#' , symbol , '#'.
	^(self getIndexedValuesFrom: indexValues at: model with: strSymbol ).
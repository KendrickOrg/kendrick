private
pickVariableAtIndexedValue: anIndex
	| result found |
	result := KEIndexedVariable new.
	result symbol: self symbol.
	found := false.
	indexList
		do: [ :each | 
			(each class = KEVariable and: (found not))
				ifTrue: [ found := true.
					result addIndex: (KENumerical new number: anIndex) ]
				ifFalse: [ result addIndex: each ] ].
	^ result
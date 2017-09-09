private
createParameterName
	| result name index found x last |
	name := 'tempTransition'.
	index := '000'.
	last := 100.
	result := 'tempTransition'.
	
	1 to: last do: [ :elem | 
		
		1 to: last do: [ :each | 
			model parameters
				at: name , index , each asString
				ifAbsent: [ found := true.
					result := name , index , each asString.
					^ result ] ].
		index := index , '0' ].
	^ result
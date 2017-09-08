private
createParameterName
	| result name index found x last |
	name := 'tempTransition'.
	index := '000'.
	last := 100.
	result := 'tempTransition'.
	found := false.
	1 to: last do: [ :elem | 
		found
			ifTrue: [ ^ result ].
		1 to: last do: [ :each | 
			found
				ifFalse: [ x := model atParameter: name , index , each asString.
					x = nil
						ifTrue: [ found := true.
							result := name , index , each asString.
							^ result ]
						ifFalse: [ each = last
								ifTrue: [ index := index , '0' ] ] ] ] ].
	^ result
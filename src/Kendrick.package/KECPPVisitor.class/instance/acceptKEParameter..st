as yet unclassified
acceptKEParameter: aNode
	| aStream tmp count1 count2 |
	aStream := WriteStream on: (String new: 60).
	parameters at: aNode symbol put: aNode value.
	aNode value isArray
		ifFalse: [
			aNode value isInterval 
			ifFalse: [ aStream nextPutAll: 'const double ' , aNode symbol asString , ' = ' , aNode value asString , ';';cr.]
			ifTrue: [ 
					aStream nextPutAll: '#define KEmin_', aNode symbol, ' ', (aNode value min) asString ; cr.
					aStream nextPutAll: '#define KEmax_', aNode symbol, ' ', (aNode value max) asString ;cr.
					aStream nextPutAll: '#define KEstep_', aNode symbol, ' ' ,  (aNode value increment) asString  ;cr. 
			]
		]
		ifTrue: [ 
			count1 := 0.
			aStream nextPutAll: 'const double ' , aNode symbol asString.
			aNode value
				do: [ :each | 
					count1 := count1 + 1.
					each isArray
						ifFalse: [ 
							count1 < 2
								ifTrue: [ aStream nextPutAll: '[nbOfSpecies] = {' ].
							count1 < aNode value size
								ifTrue: [ aStream nextPutAll: each asString , ',' ]
								ifFalse: [ aStream nextPutAll: each asString ] ]
						ifTrue: [ 
							count1 < 2
								ifTrue: [ aStream nextPutAll: '[][nbOfSpecies] = {' ].
							aStream nextPutAll: '{'.
							tmp := each.
							count2 := 0.
							tmp
								do: [ :eacha | 
									count2 := count2 + 1.	"(count1+ count2 ) < ((each size) + (aNode value size ))"
									count2 < each size
										ifFalse: [ aStream nextPutAll: eacha asString ]
										ifTrue: [ aStream nextPutAll: eacha asString , ',' ] ].
							aStream nextPutAll: '}'.
							count1 < aNode value size
								ifTrue: [ aStream nextPutAll: ',' ] ] ].
			aStream
				nextPutAll: '};';
				cr ].
	^ aStream contents
as yet unclassified
acceptKEEQuation:  aNode
	|expression aStream tmp c |
	aStream := WriteStream on: (String new: 60).
	expression := aNode expression.
		c := WriteStream on: (String new: 60).
		listCompartment = nil
		ifFalse: [ tmp:= listCompartment includes:   ((aNode variable) asString)]
		ifTrue: [ tmp:=true. ].
		
		tmp = false
		ifTrue:[ 
			aNode 	idVariable = nil
			ifTrue:[ 
				aStream nextPutAll: 'dxdt['.
				aStream nextPutAll: (compartments at: aNode variable symbol) asString, ']='.
				aStream nextPutAll: (self visitNode: expression).
				aStream nextPutAll: ';';cr. 		
			"lttam: bug: duplicate equation"
			"c nextPutAll: aStream contents."
		]
		ifFalse: [  
				bStream := WriteStream on: (String new: 60).
				c nextPutAll: 'for( size_t i =', 'KEmin_', (aNode idVariable) asString ,'-1','; i <', 'KEmax_', (aNode idVariable) asString,'; i+=', 'KEstep_', (aNode idVariable) asString ,' )';cr.
				c nextPutAll: '{';cr.
					aStream nextPutAll: 'dxdt['.
					aStream nextPutAll:  (aNode idVariable ) asString ,'+', 'KEmax_', (aNode idVariable) asString ,'*' ,(compartments at: aNode variable symbol) asString ,  ']='.			
					aStream nextPutAll: (self visitNode: expression).
					aStream nextPutAll: ';';cr.
				aStream nextPutAll: '}';cr.
		].
				listCompartment add:  (aNode variable) asString.			
				
				"aStream nextPutAll: listCompartment ;cr."
				
				bStream = nil
				ifFalse:[
				bStream contents size > 1
				ifTrue: [  
					c nextPutAll: bStream contents.
				].].	
				c nextPutAll: aStream contents.
		].
^c  contents
		

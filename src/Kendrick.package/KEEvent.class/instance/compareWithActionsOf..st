removing
compareWithActionsOf: anEvent
	|flag count|
	actions size = anEvent actions size ifFalse: [^false].	
	count := 0.
	actions keysAndValuesDo: [:key1 :value1|		
		anEvent actions keysAndValuesDo: [:key2 :value2|
			flag := false.
			value1 = value2 ifTrue: [
				key1 isAnIndex 
					ifFalse: [flag := (key1 symbol = key2 symbol)] 
					ifTrue: [flag := ((key1 symbol = key2 symbol)&(key1 idExpression1 = key2 idExpression1))]
				].
			flag ifTrue: [count := count + 1].
			]
		].
	^ (count = actions size)
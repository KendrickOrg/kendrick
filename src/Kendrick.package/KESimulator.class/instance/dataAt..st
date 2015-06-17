accessing
dataAt: aClassName
	|key rs|
	key := aClassName.
	key = #all ifTrue: [ ^ data associations ].
	aClassName isString ifTrue: [ key := STON fromString: aClassName ].
	key isArray ifFalse: [ key := Array with: key ].
	rs := OrderedCollection new.
	key do: [ :k| |tmp|
		tmp := data associationAt: k ifAbsent: [ 
			|c|
			c := OrderedCollection new.
			data keysAndValuesDo: [ :ky :v|
				(ky associations includesAll: (k associations)) ifTrue: [ 
					c add: (data associationAt: ky)
					 ]
				 ].
				c asArray
		  	 ].
		tmp isArray ifTrue: [ rs addAll: tmp ] ifFalse: [ rs add: tmp ]
	 ].
	^ rs asArray
	
as yet unclassified
timeSeriesAt: aCompartmentName
	|key rs|
	key := STON fromString: aCompartmentName.
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
	
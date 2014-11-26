as yet unclassified
dataAt: key
	^ data associationAt: key ifAbsent: [ 
		|c|
		c := OrderedCollection new.
		data keysAndValuesDo: [ :k :v|
			(k associations includesAll: (key associations)) ifTrue: [ 
				c add: (data associationAt: k)
				 ]
			 ].
		^ c asArray
		 ]
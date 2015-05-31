adapting
adaptToCollection: rcvr andSend: selector
	"This method is overriden for the dictionary structure of Kendrick"
	|r|
	(rcvr isDictionary and: [ self isDictionary ]) ifFalse:
		[ ^ self error: 'Only Kendrick dictionary structure could use this method' ].
	(rcvr keys includesAll: self keys) ifFalse:
		[ ^ self error: 'Only Kendrick dictionaries with same keys collection can perform this operation' ].
	r := self copy.
	rcvr keysAndValuesDo: [ :key :value|
		r at: key put: ((self at: key) perform: selector with: value)
		 ].
	^ r
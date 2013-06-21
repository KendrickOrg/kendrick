as yet unclassified
acceptKEEvent: aModelNode
	| aStream string  |
	string :=''.
	aStream := WriteStream on: (String new: 60).
	string := string, 'rates[', (listEvent size) asString ,'] = '.
	string := string, (self visitNode: aModelNode rate  ), ';'. 
	listEvent add: (  aModelNode actions ).
	
	  "aDictionary keysDo:[:zip|aCollection add:'zip code = ',zip]. "
	aModelNode  listActions   keysDo: [:each|
		"stream nextPutAll: (self visitNode: each)."
			
			rateOfListEvent add: (self visitNode: each).

		].
			rateOfListEvent add: '@@@'.
	aStream nextPutAll: string;cr.
	^ aStream contents
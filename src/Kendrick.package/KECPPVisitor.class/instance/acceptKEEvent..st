as yet unclassified
acceptKEEvent: aModelNode
	| aStream string string2  |
	string :=''.
	string2:=''.
	aStream := WriteStream on: (String new: 60).
	string := String tab, string, 'rates[', (numberOfEvent ) asString ,'] = '.
	string := string, 'abs',(self visitNode: aModelNode rate  ), ';'. 
	"listEvent add: (  aModelNode actions )."
	
	  "aDictionary keysDo:[:zip|aCollection add:'zip code = ',zip]. "
	streamForTranslator nextPutAll: String tab,'case ', (numberOfEvent asString), ':';cr.
	
	aModelNode  actions   keysDo: [:each|
		"stream nextPutAll: (self visitNode: each)."
			
		"	rateOfListEvent add: (self visitNode: each).
			rateOfListEvent add: (aModelNode actions at: each)."
			string2:= (self visitNode: each).			
			
			(aModelNode actions at: each) < 0
			ifTrue: [ streamForTranslator nextPutAll: String tab, string2 , '=',string2 , ' ', (aModelNode actions at: each) asString,';' ;cr.]
			ifFalse: [  streamForTranslator nextPutAll: String tab, string2 , '=',string2 , '+', (aModelNode actions at: each) asString,';' ;cr.].
	].
			streamForTranslator nextPutAll:String tab,  'break;';cr.
			"rateOfListEvent add: '@@@'."
			numberOfEvent :=numberOfEvent +1.
	aStream nextPutAll: string;cr.
	^ aStream contents
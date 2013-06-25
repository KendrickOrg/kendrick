as yet unclassified
acceptKEEvent: anEventNode
	| aStream string string2  |
	string :=''.
	string2:=''.
	
	aStream := WriteStream on: (String new: 60).
	st_eqIndex := (anEventNode eqIndex) asString.
	st_eqIndexVar := (anEventNode eqIndexVar) asString.
	
	aStream nextPutAll: String tab,'i=',st_eqIndex,';';cr.
	
			bStream := WriteStream on: (String new: 60).
	string := String tab, string, 'rates[', (numberOfEvent ) asString ,'] = '.
	string := string, 'abs',(self visitNode: anEventNode rate  ), ';'. 
	"listEvent add: (  aModelNode actions )."
				bStream = nil
				ifFalse:[
				bStream contents size > 1
				ifTrue: [  
					aStream nextPutAll: bStream contents.
				].].	
			bStream:=nil.
	
	st_eqIndexVar := ''.
	
	  "aDictionary keysDo:[:zip|aCollection add:'zip code = ',zip]. "
	streamForTranslator nextPutAll: String tab,'case ', (numberOfEvent asString), ':';cr.
	"for indexvariable in function acceptKEIndexVariable"


	anEventNode  actions   keysDo: [:each|
		"stream nextPutAll: (self visitNode: each)."
			
				
		"	rateOfListEvent add: (self visitNode: each).
			rateOfListEvent add: (aModelNode actions at: each)."
			string2:= (self visitNode: each).			
			
			(anEventNode actions at: each) < 0
			ifTrue: [ streamForTranslator nextPutAll: String tab, string2 , '=',string2 , ' ', (anEventNode actions at: each) asString,';' ;cr.]
			ifFalse: [  streamForTranslator nextPutAll: String tab, string2 , '=',string2 , '+', (anEventNode actions at: each) asString,';' ;cr.].

	].

			streamForTranslator nextPutAll:String tab,  'break;';cr.
			"rateOfListEvent add: '@@@'."
			numberOfEvent :=numberOfEvent +1.

	aStream nextPutAll: string;cr.
	^ aStream contents
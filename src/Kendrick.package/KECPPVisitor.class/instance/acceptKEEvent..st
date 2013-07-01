as yet unclassified
acceptKEEvent: anEventNode
	| aStream string string2  |
	string :=''.
	string2:=''.
	aStream := WriteStream on: (String new: 60).
	string := String tab, string, 'rates[', (numberOfEvent ) asString ,'] = '.
	string := string, (self visitNode: anEventNode rate  ), ';'. 	
	strInitializeTrans nextPutAll: String tab, String tab, 'case ', (numberOfEvent asString), ':';cr.	
	anEventNode actions keysAndValuesDo: [:name :value|
		string2 := (self visitNode: name).
		value > 0 ifTrue: [ strInitializeTrans nextPutAll: String tab, String tab, String tab, string2 , '=', string2, '+', value asString,';' ;cr].
		value < 0 ifTrue: [ strInitializeTrans nextPutAll: String tab, String tab, String tab, string2 , '=', string2, value asString,';' ;cr]			
	].
	strInitializeTrans nextPutAll:String tab, String tab, String tab, 'break;';cr.
	numberOfEvent := numberOfEvent +1.
	aStream nextPutAll: string;cr.
	^ aStream contents
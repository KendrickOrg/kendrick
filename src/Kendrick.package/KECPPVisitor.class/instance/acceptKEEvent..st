as yet unclassified
acceptKEEvent: arg1
	| tmp1 tmp2 tmp4 tmp6 tmp12 |
	tmp2 := ''.
	tmp4 := ''.
	tmp1 := WriteStream on: (String new: 60).
	arg1 eqIndexVar ifNotNil: [ eventIndex := arg1 eqIndex - 1 ].
	tmp2 := String tab , tmp2 , 'rates[' , numberOfEvent asString
		, '] = '.
	tmp2 := tmp2 , (self visitNode: arg1 rate) , ';'.
	strInitializeKEMath
		ifNotNil: [ tmp1 nextPutAll: strInitializeKEMath contents.
			strInitializeKEMath := nil ].
	tmp6 := strInitializeTrans.
	tmp6
		nextPutAll: String tab , String tab , 'case ' , numberOfEvent asString , ':';
		cr.
	arg1 actions
		keysAndValuesDo: [ :arg2 :arg3 | 
			tmp4 := self visitNode: arg2.
			arg3 > 0
				ifTrue: [ | tmp8 |
					tmp8 := strInitializeTrans.
					tmp8
						nextPutAll:
							String tab , String tab , String tab , tmp4 , '=' , tmp4 , '+'
								, arg3 asString , ';';
						cr ].
			arg3 < 0
				ifTrue: [ | tmp10 |
					tmp10 := strInitializeTrans.
					tmp10
						nextPutAll:
							String tab , String tab , String tab , tmp4 , '=' , tmp4
								, arg3 asString , ';';
						cr ] ].
	tmp12 := strInitializeTrans.
	tmp12
		nextPutAll: String tab , String tab , String tab , 'break;';
		cr.
	numberOfEvent := numberOfEvent + 1.
	eventIndex := -1.
	tmp1
		nextPutAll: tmp2;
		cr.
	^ tmp1 contents
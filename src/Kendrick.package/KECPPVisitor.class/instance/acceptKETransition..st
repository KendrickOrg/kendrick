as yet unclassified
acceptKETransition: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp6 tmp8 tmp10 |
	tmp2 := ''.
	tmp1 := WriteStream on: (String new: 60).
	arg1 eqIndexVar ifNotNil: [ eventIndex := arg1 eqIndex - 1 ].
	tmp2 := String tab , tmp2 , 'rates[' , numberOfEvent asString
		, '] = '.
	tmp2 := tmp2 , (self visitNode: arg1 rate) , ';'.
	strInitializeKEMath
		ifNotNil: [ tmp1 nextPutAll: strInitializeKEMath contents.
			strInitializeKEMath := nil ].
	tmp3 := ''.
	arg1 fromStatus ifNotNil: [ tmp3 := arg1 fromStatus symbol asString ].
	tmp4 := ''.
	arg1 toStatus ifNotNil: [ tmp4 := arg1 toStatus symbol asString ].
	tmp6 := strInitializeTrans.
	tmp6
		nextPutAll:
			String tab , 'listOfTransitions[' , numberOfEvent asString
				, '].fromStatus = "' , tmp3 , '";';
		cr.
	tmp8 := strInitializeTrans.
	tmp8
		nextPutAll:
			String tab , 'listOfTransitions[' , numberOfEvent asString
				, '].toStatus = "' , tmp4 , '";';
		cr.
	tmp10 := strInitializeTrans.
	tmp10
		nextPutAll:
			String tab , 'listOfTransitions[' , numberOfEvent asString
				, '].specieID = ' , arg1 eqIndex asString , ';';
		cr.
	numberOfEvent := numberOfEvent + 1.
	eventIndex := -1.
	tmp1
		nextPutAll: tmp2;
		cr.
	^ tmp1 contents
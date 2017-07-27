tests
createADictionaryForTest
	| tmp1 |
	tmp1 := Dictionary new.
	tmp1
		at: #S put: true;
		at: #I put: true;
		at: #R put: true.
	^ tmp1
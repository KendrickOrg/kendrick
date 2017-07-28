tests
createADictionaryForTest
	|dictionary|
	dictionary := Dictionary new.
	dictionary at: #S put: true.
	dictionary at: #I put: true.
	dictionary at: #R put: true.
	^ dictionary
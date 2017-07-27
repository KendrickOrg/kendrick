printing
printOn: arg1
	arg1 nextPutAll: symbol asString.
	indexList do: [ :arg2 | arg1 nextPutAll: '[' , arg2 asString , ']' ]
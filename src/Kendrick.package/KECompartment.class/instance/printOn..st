printing
printOn: arg1
	^ arg1
		nextPutAll:
			(String
				streamContents: [ :arg2 | 
					| tmp2 |
					tmp2 := STON writer.
					tmp2
						on: arg2;
						nextPut: dictionary ])
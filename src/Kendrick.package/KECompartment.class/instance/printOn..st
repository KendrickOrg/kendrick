printing
printOn: stream
	"Represent compartment with STON syntax"
	"Like : {#status:#S,#species:#reservoir1}"

	^ stream
		nextPutAll:
			(String
				streamContents: [ :s | 
					STON writer
						on: s;
						nextPut: dictionary ])
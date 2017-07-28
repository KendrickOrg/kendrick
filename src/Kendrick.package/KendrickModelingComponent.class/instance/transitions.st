public-api
transitions

	^ transitions 
		ifNotNil: [ transitions convertToCompatibleBackendRepresentation]
		ifNil: [ 
			transitions := 
				backEndEntity transitions
					collect: [ :t | (t from associations first value -> nil -> t to associations first value) ] 
		]
		
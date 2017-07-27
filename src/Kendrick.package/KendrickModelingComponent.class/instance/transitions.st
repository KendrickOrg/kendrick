public-api
transitions
	^ transitions
		ifNil: [ transitions := backEndEntity transitions
				collect: [ :arg1 | 
					arg1 from associations first value -> nil
						-> arg1 to associations first value ] ]
		ifNotNil: [ transitions convertToCompatibleBackendRepresentation ]
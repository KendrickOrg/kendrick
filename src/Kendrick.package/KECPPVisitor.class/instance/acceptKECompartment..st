as yet unclassified
acceptKECompartment: arg1
	| tmp1 tmp2 |
	tmp1 := WriteStream on: (String new: 60).
	compartments at: arg1 status put: nbOfCompartments.
	nbOfCompartments := nbOfCompartments + 1.
	tmp1
		nextPutAll:
			String tab , 'compartmentName['
				, (compartments at: arg1 status) asString , '] = "'
				, arg1 status asString , '";';
		cr.
	tmp2 := arg1 numberOfSpecies.
	1 to: tmp2 do: [ :tmp3 | 
		tmp1
			nextPutAll:
				String tab , 'initialValue[' , (compartments at: arg1 status) asString
					, '][' , (tmp3 - 1) asString , '] = '
					, (arg1 initialValue at: tmp3) asString , ';';
			cr ].
	^ tmp1 contents
as yet unclassified
acceptKEEQuation: arg1
	| tmp1 tmp2 |
	tmp1 := WriteStream on: (String new: 60).
	tmp2 := WriteStream on: (String new: 60).
	tmp2 nextPutAll: (self visitNode: arg1 expression).
	defSumSigma := false.
	equaChecks
		at: arg1 variable symbol
		ifAbsent: [ equaChecks at: arg1 variable symbol put: 1.
			tmp1
				nextPutAll: String tab , 'for (int i = 0; i < nbOfSpecies; i++)';
				cr;
				nextPutAll: String tab , '{';
				cr.
			strInitializeKEMath
				ifNotNil: [ tmp1 nextPutAll: strInitializeKEMath contents.
					strInitializeKEMath := nil ].
			tmp1
				nextPutAll:
					String tab , String tab , 'dxdt('
						, (compartments at: arg1 variable symbol) asString , ', i) = ';
				nextPutAll: tmp2 contents , ';';
				cr;
				nextPutAll: String tab , '}';
				cr ].
	^ tmp1 contents
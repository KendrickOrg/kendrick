as yet unclassified
openMap: continent countries: countries coloredBy: function
	|continentCountries cData sum cn b|
	continentCountries := RTSVGPath perform: continent.
	cData := OrderedCollection new.
	continentCountries do: [ :each|
		(countries includes: each)
		ifTrue: [ cData add: (Array with: each with: ((self dataAt: each) perform: function)) ]
		ifFalse: [ cData add: (Array with: each with: 0) ]
		 ].
	sum := cData sum: [ :c| c at: 2 ].
	cn := RTNColorLinearNormalizer 
		inContext: (cData collect: [:c| c at: 2]) asArray
		lowColor: Color white
		highColor: Color red.
	b := RTMapBuilder new.
	b countries: cData asArray named: [ :c| c at: 1 ].
	b color: [ :c| cn rtValue: (c at: 2) ].
	b withPopup: [ :c|
		(c at: 1) asString, ': ',
		(((c at: 2) / sum * 100 asFloat roundTo: 0.01) printString), '%'].
	b scale: 2.
	b open
as yet unclassified
openMap: continent countries: countries coloredBy: function
	|continentCountries results sum cn b|
	continentCountries := RTSVGPath perform: continent.
	results := Dictionary new.
		
	continentCountries do: [:aCountry|
		(countries includes: aCountry) ifTrue: [ 
			results at: aCountry put: ((self dataAt: aCountry) perform: function)]
		ifFalse: [ results at: aCountry put: 0 ].
		 ].

	sum := results sum: [ :each| each value ].
	cn := RTNColorLinearNormalizer 
		inContext: results asArray
		lowColor: Color white
		highColor: Color red.
	b := RTMapBuilder new.
	
	b countries: results associations named: [ :c| c key ].
	b color: [ :c| cn rtValue: (c value) ].
	b withPopup: [ :c|
		(c key) asString, ': ',
		(((c value) / sum * 100 asFloat roundTo: 0.01) printString), '%'].
	b scale: 2.
	b open
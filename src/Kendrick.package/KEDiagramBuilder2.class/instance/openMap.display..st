as yet unclassified
openMap: continent display: countries
	|cc cData sum cn b|
	cc := RTSVGPath perform: continent.
	cData := OrderedCollection new.
	cc do: [ :each|
		(countries includes: each)
		ifTrue: [ cData add: (Array with: each with: ((self dataAt: each) perform: #peakOfEpidemic)) ]
		ifFalse: [ cData add: (Array with: each with: 0) ]
		 ].
	sum := (cData collect: [ :c| c at: 2 ]) sum.
	cn := RTNColorLinearNormalizer 
		inContext: (cData collect: [:c| c at: 2]) asArray
		lowColor: (Color r: 1.0 g: 1.0 b: 1.0)
		highColor: (Color r: 1.0 g: 0.0 b: 0.0).
	b := RTMapBuilder new.
	b countries: cData asArray named: [ :c| c at: 1 ].
	b color: [ :c| cn rtValue: (c at: 2) ].
	b withPopup: [ :c|
		(c at: 1) asString, ': ',
		(((c at: 2) / sum * 100 asFloat roundTo: 0.0001) printString), '%'].
	b scale: 2.
	b open
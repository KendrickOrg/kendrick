accessing
plotMap: countries in: continent data: data
	"countries: the list of country names, continent: the name of the continent or the whole world, data: the infectious number of each country"
	"This method will show the continent map in which the color of country depending on the infectious percent resulting of the simulation"
	| cc countryData sum cn b |
	cc := RTSVGPath perform: continent.
	countryData := OrderedCollection new.
	cc do: [ :each|
		(countries includes: each) 
		ifTrue: [ countryData add: (Array with: each with: (data at: (countries indexOf: each))) ]
		ifFalse: [ countryData add: (Array with: each with: 0) ]
		 ].
	sum := data sum.
	cn := RTNColorLinearNormalizer
		inContext: (countryData collect: [:c | c at: 2]) asArray
		lowColor: (Color r:1.0 g:1.0 b:1.0)
		highColor: (Color r:1.0 g:0 b:0.0).
		
	b := RTMapBuilder new.
	b countries: countryData asArray named: [ :c | c at: 1 ].
	b color: [ :c | cn rtValue: (c at: 2) ].
	b withPopup: [ :c |
		(c at: 1) asString, ': ',
		(((c at: 2) / sum * 100 asFloat roundTo: 0.0001) printString), '%'].
	b scale: 2.
	b open.
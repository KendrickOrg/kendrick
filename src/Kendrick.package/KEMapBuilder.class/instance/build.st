as yet unclassified
build
	|b max cn countriesData|
	b := RTMapBuilder new.
	max := data max.
	countriesData := countries collect: [ :c| Array with: c with: (data at: (countries indexOf: c)) ].
	cn := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 8 scheme: 'Reds');
		command: [ :aCountry | (countriesData detect: [ :c | c first = aCountry ]) second / max ].
	b countries: countries.
	b color: cn.
	b view @ RTZoomableView.
	^ b
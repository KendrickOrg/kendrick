as yet unclassified
build
	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	tmp1 := RTMapBuilder new.
	tmp2 := data max.
	tmp4 := countries
		collect: [ :arg1 | Array with: arg1 with: (data at: (countries indexOf: arg1)) ].
	tmp6 := RTMultiLinearColor new.
	tmp6 colors: (RTColorPalette sequential colors: 8 scheme: 'Reds').
	tmp3 := tmp6
		command: [ :arg2 | (tmp4 detect: [ :arg3 | arg3 first = arg2 ]) second / tmp2 ].
	tmp1
		countries: countries;
		color: tmp3.
	tmp1 view @ RTZoomableView.
	^ tmp1
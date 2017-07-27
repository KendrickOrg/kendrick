as yet unclassified
build
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp7 tmp9 |
	tmp1 := RTGrapher new.
	tmp1 extent: 400 @ 200.
	tmp9 := RTMultiLinearColorForIdentity new.
	tmp9 objects: self legends.
	tmp2 := tmp9
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	tmp4 := legends size.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := RTData new.
		tmp5
			noDot;
			points: (data at: tmp6) value index;
			x: #yourself;
			y: [ :arg1 | (data at: tmp6) value at: arg1 ];
			connectColor: (tmp2 rtValue: (legends at: tmp6)).
		tmp1 add: tmp5 ].
	xLabel
		ifNil: [ tmp1 axisX title: 'Time (days)' ]
		ifNotNil: [ tmp1 axisX title: xLabel ].
	yLabel
		ifNil: [ tmp1 axisY title: 'Number of individuals' ]
		ifNotNil: [ tmp1 axisY title: yLabel ].
	tmp1 axisY noDecimal.
	tmp3 := RTLegendBuilder new.
	tmp3 view: tmp1 view.
	self legendTitle ifNil: [ legendTitle := 'Compartments' ].
	tmp3 addText: legendTitle.
	tmp4 := legends size.
	1 to: tmp4 do: [ :tmp6 | 
		tmp7 := nil.
		tmp7 := tmp2 rtValue: (legends at: tmp6).
		tmp3 addColor: tmp7 text: (legends at: tmp6) ].
	tmp3 build.
	tmp1 view @ RTZoomableView.
	^ tmp1
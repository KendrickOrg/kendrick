as yet unclassified
build2
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp8 |
	tmp1 := RTGrapher new.
	tmp1 extent: 400 @ 200.
	tmp8 := RTMultiLinearColorForIdentity new.
	tmp8 objects: timeSeries keys.
	tmp2 := tmp8
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	timeSeries keys
		do: [ :arg1 | 
			| tmp9 |
			tmp9 := RTData new.
			tmp9
				noDot;
				points: (timeSeries at: arg1) value index;
				x: #yourself;
				y: [ :arg2 | (timeSeries at: arg1) value at: arg2 ];
				connectColor: (tmp2 rtValue: arg1).
			tmp1 add: tmp9 ].
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
	tmp4 := timeSeries keys size.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := tmp2 rtValue: (timeSeries keys at: tmp6).
		tmp3 addColor: tmp5 text: (timeSeries keys at: tmp6) ].
	tmp3 build.
	tmp1 view @ RTZoomableView.
	^ tmp1
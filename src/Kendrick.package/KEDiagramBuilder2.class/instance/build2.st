as yet unclassified
build2
|b normalize lb|
	b := RTGrapher new.
	b extent: 400 @ 200.
	normalize := RTMultiLinearColorForIdentity new 
						objects: timeSeries keys;
						colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	timeSeries keys do: [ :i|
		|ds|
		ds := RTData new.
		ds noDot.
		ds points: (timeSeries at: i) value index.
		ds x: #yourself.
		ds y: [ :x| (timeSeries at: i) value at: x ].
		ds connectColor: (normalize rtValue: i).
		b add: ds.
		 ].
	xLabel ifNil: [ b axisX title: 'Time (days)' ] 
	       ifNotNil: [ b axisX title: xLabel ].
	yLabel ifNil: [ b axisY title: 'Number of individuals' ] 
	       ifNotNil: [ b axisY title: yLabel ].
	b axisY noDecimal.
	lb := RTLegendBuilder new.
	lb view: b view.
	self legendTitle ifNil: [ legendTitle := 'Compartments' ].
	lb addText: legendTitle.
	1 to: timeSeries keys size do: [ :i| |c|
		c:= (normalize rtValue: (timeSeries keys at: i)).
		lb addColor: c text: (timeSeries keys at: i) ].
	lb build.
	b view @ RTZoomableView.
	^ b 
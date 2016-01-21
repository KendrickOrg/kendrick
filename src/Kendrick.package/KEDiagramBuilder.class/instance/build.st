as yet unclassified
build
|b normalize lb|
	b := RTGrapher new.
	b extent: 400 @ 200.
	normalize := RTMultiLinearColorForIdentity new 
						objects: self legends;
						colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	1 to: legends size do: [ :i|
		|ds|
		ds := RTDataSet new.
		ds noDot.
		ds points: (data at: i) value index.
		ds x: #yourself.
		ds y: [ :x| (data at: i) value at: x ].
		ds connectColor: (normalize rtValue: (legends at: i)).
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
	1 to: legends size do: [ :i| |c|
		c:= (normalize rtValue: (legends at: i)).
		lb addColor: c text: (legends at: i) ].
	lb build.
	"b build."
	b view @ RTZoomableView.
	^ b 
	
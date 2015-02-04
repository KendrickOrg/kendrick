as yet unclassified
open
	|b normalize lb|
	b := RTGrapher new.
	b extent: 400 @ 200.
	(self legends size >= 3) ifTrue: [ 
		normalize := RTMultiLinearColorForIdentity new 
						objects: self legends;
						colors: (ColorPalette qualitative colors: (self legends size) scheme: 'Set1')
		 ].
	1 to: legends size do: [ :i|
		|ds|
		ds := RTDataSet new.
		ds points: (data at: i) value index.
		ds x: #yourself.
		ds y: [ :x| (data at: i) value at: x ].
		ds noDot.
		legends size < 3 
		ifTrue: [ ds connectColor: (self colors at: i) ]
		ifFalse: [ ds connectColor: (normalize rtValue: (legends at: i)) ].
		b add: ds
		 ].
	xLabel ifNil: [ b axisX title: 'Time' ] 
	       ifNotNil: [ b axisX title: xLabel ].
	yLabel ifNil: [ b axisY title: 'Number of individuals' ] 
	       ifNotNil: [ b axisY title: yLabel ].
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Compartments'.
	1 to: legends size do: [ :i| |c|
		legends size < 3 
		ifTrue: [ c:= (self colors at: i) ]
		ifFalse: [ c:= (normalize rtValue: (legends at: i)) ].
		lb addColor: c text: (legends at: i)
		 ].
	lb build.
	b build.
	b view @ RTZoomableView.
	b open
	
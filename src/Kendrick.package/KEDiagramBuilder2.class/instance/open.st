as yet unclassified
open
	|b normalize sttCol|
	b := RTGrapherBuilder new.
	sttCol := OrderedCollection new.
	data isDictionary ifTrue: [ sttCol addAll: data keys ] ifFalse: [ sttCol add: data ].
	b extent: 400 @ 200.
	normalize := RTMultiLinearColorForIdentity new 
						objects: sttCol;
						colors: (ColorPalette qualitative colors: sttCol size scheme: 'Set1').
	1 to: sttCol size do: [ :i|
		|ds|
		ds := RTDataSet new.
		ds dotShape rectangle size: 0.
		ds points: (data at: (sttCol at: i) ifAbsent: [ sttCol at: i ]) index.
		ds x: #yourself.
		ds y: [ :x| (data at: (sttCol at: i) ifAbsent: [ sttCol at: i ]) at: x ].
		ds connectColor: (normalize rtValue: (sttCol at: i)).
		b add: ds
		 ].
	"xLabel ifNil: [ b axisXTitled: 'Time' ] ifNotNil: [ b axisXTitled: xLabel ].
	yLabel ifNil: [ b axisYTitled: 'Number of individuals' ] ifNotNil: [ b axisYTitled: yLabel ]."
	self legends ifNotNil: [ 
		|lb|
		lb := RTLegendBuilder new.
		lb view: b view.
		lb addText: 'Compartments'.
		1 to: sttCol size do: [ :i|
			lb addColor: (normalize rtValue: (sttCol at: i))
				text: (legends at: i)
			 ].
		lb build
		 ].
	b build.
	b view @ RTZoomableView.
	b open
	
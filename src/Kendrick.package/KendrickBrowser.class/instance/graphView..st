as yet unclassified
graphView: constructor
	"visualization of the graph of the simulation"
	constructor  roassal2
		title: 'Visualization';
		act: [:p | p update]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update';
          painting: [:each :data |
   			data class== KETimeSeries ifTrue:[  	       
				| b |
				b := RTCharterBuilder new view: each.
				b extent: 400 @ 200.
				b shape rectangle size: 0.
				b points: data index.
				b x: #yourself.
				b y: [ :x | data at: x ].
				b connectDotColor: Color blue.
				b axisXTitled: 'Time'.
				b axisYTitled: 'Number of individuals of ' , (donne keyAtValue: data).
				b build.
				each canvas camera translateBy: 0 @ -100.
				each @RTDraggableView.]
			]
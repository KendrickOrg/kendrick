as yet unclassified
graphView: constructor
	"visualization of the graph of the simulation"
	constructor  roassal2
		title: 'Visualization';
		act: [:p | p update]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update';
          painting: [:each :data |
	 		| bg|
   			data class== KETimeSeries ifTrue:[  	       
				bg := GET2Line new view: each; data: (data index).
				bg y: [:x | data at: x];
				title:'Graph of compartment ' ,(donne keyAtValue: data);
					lineWidth: 2;
                		height: 200;
                		width: 500.
		
      			bg build.
				each canvas camera translateBy: 0 @ -100.
				each @RTDraggableView.]
			]
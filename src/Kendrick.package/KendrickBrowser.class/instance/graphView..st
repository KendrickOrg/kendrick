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
   			data class== KESeries ifTrue:[  	       
				bg := GET2Line new view: each; data: ( data index).
				bg y: [: val | (data atIndex:val) at:1];
				title:'Graph';
				lineWidth: 2;
                		height: 200;
                		width: 500.
      				bg build.
				each @RTDraggableView.]
			]
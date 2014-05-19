as yet unclassified
graphView: constructor
	"visualization of the graph of the simulation"
	
	constructor  roassal2
		title: 'Visualization';
		act: [:p | p update]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update';
               painting: [:each :serie |
	 		| bg |
   			serie class== KESeries ifTrue:[   		       
			bg := GET2Line new view: each; data: (serie index).
			bg y: [:x | (serie atIndex:x) at:1];
 			color: Color blue.
      			bg build.]]
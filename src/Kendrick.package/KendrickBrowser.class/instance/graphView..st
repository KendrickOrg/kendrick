as yet unclassified
graphView: constructor
	"visualization of the graph of the simulation"
	constructor  roassal2
		title: 'Visualization';
		act: [:p | p update]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update';
               painting: [:each :serie |
	 		| bg normalizer|
   			serie class== KESeries ifTrue:[  
				normalizer := RTNColorLinearNormalizer
                                        inContext: (serie index) withCommand: #second lowColor: Color paleRed highColor: Color blue. 		       
				bg := GET2Line new view: each; data: (serie index).
				bg y: #second.
				bg y: [:x | (serie atIndex:x) at:1];
				lineWidth: 2;
                		height: 200;
                		width: 500.
				bg title:'Graph'.
      				bg build.
				each @RTDraggableView.]
			]
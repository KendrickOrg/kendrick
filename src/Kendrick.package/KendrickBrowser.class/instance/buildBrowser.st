building
buildBrowser
	"build the browser"
	browser := GLMTabulator new initialExtent: 1400@1400.
	browser title: 'Kendrick Browser'.
	browser 
		row:[ :rows | rows
			column: #models;
			column: #compartments;
			column: #equations;
			column: #parameters.] size: 200;
		row: #graph.
			
	"Panel of models"
	browser transmit
		to: #models;
		andShow: [ :a | 
			a title: 'Models'.
			self modelsIn: a ].	
			
     "Panel of compartments"
	browser transmit
		from: #models;
		to: #compartments;
		andShow: [ :a |
			a title:'Compartments'. 
			self compartimentsIn: a.].		
						
	"Panel of equations"
	browser transmit
		from: #models;
		to: #equations;
		andShow: [ :a | 
					a title: 'Equations'.
					self equationsIn: a ].	
					
	"Panel of parameters"
	browser transmit
		from: #models;
		to: #parameters;
		andShow: [ :a | 
					a title: 'Parameters'.
					self parametresIn: a ].
				
	"Visualisation des graphes"
	browser transmit
		from: #models;
		to:#graph;
		andShow:[ :b |
			self graphViewIn: b.
			self deterministicSimulationIn: b.
			self stochasticSimulationIn: b.
			self individualBasedSimulationIn: b.].
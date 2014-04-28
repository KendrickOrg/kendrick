as yet unclassified
buildBrowser
	"build the browser"
	browser := GLMTabulator new.
	browser
		column: #models;
		column: #compartments;
		column: #equations;
		column: #parametres.	
	"Panneau des modeles"
	browser transmit
		to: #models;
		andShow: [ :a | 
					a title: 'Models'.
					self modelsIn: a ].	
     "Panneau des compartiments"
	browser transmit
		from: #models;
		to: #compartments;
		andShow: [ :a | 
					a title: 'Compartments'.
					self compartimentsIn: a ].	
	"Panneau des équations différentielles"
	browser transmit
		from: #models;
		to: #equations;
		andShow: [ :a | 
					a title: 'Equations'.
					self equationsIn: a ].	
	"Paneau des paramètres"
	browser transmit
		from: #models;
		to: #parametres;
		andShow: [ :a | 
					a title: 'Parameters'.
					self parametresIn: a ]
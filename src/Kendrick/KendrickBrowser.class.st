"
KendrickBrowser is a browser which allow to navigate in Kendrick model.

self open
"
Class {
	#name : #KendrickBrowser,
	#superclass : #Object,
	#instVars : [
		'browser',
		'donne'
	],
	#category : 'Kendrick-Glamour'
}

{ #category : #'as yet unclassified' }
KendrickBrowser class >> menuCommandOn: aBuilder [


	(aBuilder item: #'Kendrick Browser')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick Browser';
			icon: KEIcon smallKendrick;
			action: [ self new open ]	

]

{ #category : #'as yet unclassified' }
KendrickBrowser class >> open [
	"self open"	
 	^self new open
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> boxViewIn: constructor [

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :model |
				| nodes transitcollection arrow nd nb events demography|
				nd:=0.
				nb:=0.
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				demography := OrderedCollection new.
				
				"Collect all nodes of the graph"
				model population compartments collect:[:each | nodes add: (each asString)].
			
				"Generate relation between nodes"
				events := (KEEventGenerator new) generateEvents: model.
				events do: [:event | 
					
				(((event fromStatus asString) = 'empty') and:[(event toStatus) isNotEmpty ]) ifTrue:[
						|nn|
						nn:= 'Naissance',(nb asString).
						demography add: nn.
						transitcollection add: (nn->(event toStatus asString)).
						nb:=nb+1.
					].
					
					(((event fromStatus) isNotEmpty) and:[(event toStatus asString) =  'empty' ]) ifTrue:[
						|nn|
						nn:= 'Deces',(nd asString).
						demography add: nn.
						transitcollection add: ((event fromStatus asString)->nn).
						nd:=nd+1.
					].
					(((event fromStatus) isNotEmpty) and:[(event toStatus) isNotEmpty]) ifTrue:[
						transitcollection add: ((event fromStatus asString)->(event toStatus asString)).
					]
				].
			
				"Build different nodes of graph"
				nodes do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := ((RTBox new size: 80) + RTLabel) elementOn: aLabel. n @ RTDraggable ].
					view add: n.
				].
				demography do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := (RTBox new) elementOn: aLabel. n @ RTDraggable  ].
					view add: n.
				].
			
				"Build the edges between box"
				arrow := RTArrowedLine new 
					color: Color red; 
					attachPoint: RTHorizontalAttachPoint instance.
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.	
								
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
			]
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> buildBrowser [
	"build the browser"
	browser := GLMTabulator new initialExtent: 1500@1000.
	browser title: 'Kendrick Browser'.
	"act: [:p | p update]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update the Browser'."
"	browser
		act: [ :b | b entity add: KEModel new ]
		icon: GLMUIThemeExtraIcons glamorousAdd
		entitled: 'Add an item in the collection'."
	browser
		act: [ :b | b entity removeLast ]
		icon: GLMUIThemeExtraIcons glamorousRemove
		entitled: 'Remove the select Model on the Browser'.
	browser 
		row:[ :rows | rows
			column: #models;
			column: #populations;
			column: #compartments;
			column: #equations;
			column: #parameters.] size: 150;
		row:[ :rows | rows
			column: #modi_models;
			column: #modi_populations;
			column: #modi_compartments;
			column: #modi_equations;
			column: #modi_parameters.] size: 70;
		row: #options size: 70;
		row: [ :a | a
			column: #graph;
			column: #view] .

	"Panel of models"
	browser transmit
		to: #models;
		andShow: [ :a | 
			a title: 'Models'.
			self modelsIn: a ].	
	
	"Panel of populations"
	browser transmit
		from: #models;
		to: #populations;
		andShow: [ :a | 
			a title: 'Populations'.
			self populationsIn: a ].
		
     "Panel of compartments"
	browser transmit
		from: #populations;
		to: #compartments;
		andShow: [ :a |
			a title:'Compartments'. 
			self compartimentsIn: a.].		
	browser transmit
		from: #compartments;
		to: #modi_compartments;	
		andShow: [ :a :m |
			self updateCompartmentIn: a.].	
						
	"Panel of equations"
	browser transmit
		from: #models;
		to: #equations;
		andShow: [ :a | 
			a title: 'Equations'.
			self equationsIn: a ].	
	browser transmit
		from: #equations;
		to: #modi_equations;	
		andShow: [ :a :m |
			self updateEquationsIn: a.].
		
	"Panel of parameters"
	browser transmit
		from: #models;
		to: #parameters;
		andShow: [ :a | 
			a title: 'Parameters'.
			self parametersIn: a ].
	browser transmit
		from: #parameters;
		to: #modi_parameters;	
		andShow: [ :a :m |
			self updateParametersIn: a.].	
	"Panel of different options"
	browser transmit
		from: #models;
		to:#options;
		andShow:[ :b | b dropDownList
			title: 'Options';
			display:[#('Deterministic Simulation' 'Stochastic Simulation' 'Individual-Based Simulation' 'Models like Box')];
			selectedIndex: 4.
			].
	"Panel for list the different graph"
	browser transmit
		from: #models;
		from: #options;
		to:#graph;
		andShow:[ :a :m :o|
				o ='Models like Box' ifTrue:[
					self boxViewIn: a.].
				o='Deterministic Simulation' ifTrue:[
					self deterministicSimulationIn: a.
					].
				o='Stochastic Simulation' ifTrue:[
					self stochasticSimulationIn: a.].
				o='Individual Base Simulation' ifTrue:[
					self individualBasedSimulationIn: a.].
			].
		"Panel for visualization of select graph"
		browser transmit
		from: #graph;
		to:#view;
		andShow:[ :a | 
			self graphView:a]
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> compartimentsIn: constructor [

	"Show the list of compartments with the number of individuals"
	
	constructor table
		display: [ :population | population compartments] ;
		column: 'Name' evaluated: [ :compartment | compartment asString] width:120;
		column: 'Number Of Individuals' evaluated: [ :compartment | compartment asString];
		selectionAct: [:courbe | courbe selection inspect] on: $v entitled: 'View'
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> deterministicSimulationIn: constructor [

	"run the deterministic simulation of the model"
		| x |
		x:=0.
		
		constructor list
		title: 'Deterministic simulation';
		
		display: [ :a | |simulator| 
			simulator := KESimulatorBuilder new.
			donne := (simulator run: #RK4 tMin: 0.0 tMax: 200 step: 1 model: a) data.
			"donne :=((a run: #RK4 from: 0.0 to: 200 step: 1); simulator) data."];
		format: [donne keys at:(x:=x+1).] ;
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].
		
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> equationsIn: constructor [

	"Show the list of equations"
	
	constructor list
		display: [ :model| model equations];
		format: [ :model| model expression asString].
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> graphView: constructor [
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
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> individualBasedSimulationIn: constructor [

	"run the individual base simulation of the model"
		|x|
		x:=0.
		constructor list
		title: 'Individual Base Simulation';
		display: [ :a | |simulator|
			simulator := KESimulatorBuilder new.
			donne := (simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 200 step: 0.1 model: a) data.
			"donne := ((a  run: #IBMDiscreteTime from: 0.0 to: 10 step: 0.1); simulator) data" ];
		format: [donne keys at:(x:=x+1).];
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> modelsIn: constructor [
	"Show the list of model"
	constructor list
		display: [ :model | model ];
		format: [:model | model name]
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> open [
	"Open the browser on the model collector"
	|collection|
	collection := KEExamples models.
	
	self buildBrowser.
	browser openOn: collection. 
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> parametersIn: constructor [

	"Show the list of parameters with its value"

	constructor table
		display: [ :model | model parameters] ;
		column: 'Name' evaluated: [ :parameter| parameter asString] width:150;
		column: 'Value' evaluated: [ :parameter | parameter asString]";
		selectionAct: [:courbe | courbe selection inspect] on: $v entitled: 'View'"
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> populationsIn:constructor [
	"Show the list of model"
	constructor list
		display: [ :model | model population]";
		format: [:model | modelgetNbSubPopulations]"
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> stochasticSimulationIn: constructor [

	"run the stochastic simulation of the model"
	
		|x|
		x:=0.
		constructor list
		title: 'Stochastic Simulation';
		display: [ :a | |simulator|
			simulator := KESimulatorBuilder new.
			donne := (simulator run: #ExplicitTauLeap tMin: 0 tMax: 730 step: 1 model: a) data
			"donne := ((a run: #ExplicitTauLeap from: 0 to: 730 step: 1 ); simulator) data"];
		format: [donne keys at:(x:=x+1).];
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> updateCompartmentIn: constructor [
	"Update the value of each pannel"
	constructor magritte
			description: [:compartment| compartment  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v | compartment numberOfIndividuals:v. browser update ] . 
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> updateEquationsIn: constructor [
	"Update the value of equations"
	constructor magritte
			description: [:equation| equation  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v |  browser update ] . 
]

{ #category : #'as yet unclassified' }
KendrickBrowser >> updateParametersIn: constructor [
	"Update the value of parameters"
	constructor magritte
			description: [:equation| equation  magritteDescription] ;
			onAnswer: [ :compartment :presentation :v |  browser update ] . 

	
]

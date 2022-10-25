"
In Kendrick, we have the following dependencies:

- PolyMath in order to use the differential equation solver, n-array and RNGs
- DataFrame in order to use tabular data: Kendrick simulations generate DataFrame that we can export as CSV or Excel files,
- Graph Algorithms is use to generate regular graphs (grids) and random graphs like Barabasi, etc ... https://github.com/pharo-ai/graph-algorithms
"
Class {
	#name : #BaselineOfKendrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfKendrick
}

{ #category : #baselines }
BaselineOfKendrick >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec repository: 'https://github.com/KendrickOrg/kendrick'.
		spec
			baseline: 'PolyMath' with: [ 
				spec
					repository: 'github://PolyMathOrg/PolyMath:v1.0.5';
					loads: 'Core' ];
			baseline: 'DataFrame'
			with: [ spec repository: 'github://PolyMathOrg/DataFrame:v2.0' ].

		spec
			group: 'Core' with: #( 'Kendrick-Core' );
			group: 'Examples' with: #( 'Kendrick-Examples' );
			group: 'DSL' with: #( 'Kendrick-DSL' );
			group: 'Tests' with: #( 'Kendrick-Tests' );
			group: 'default' with: #( 'Core' 'Examples' 'DSL' 'Tests' ) ].

	spec
		for: #'pharo8.x' do: [ 
			spec
				baseline: 'PetitParser2Core'
				with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
				with: [ 
					spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Ston'
				with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'Roassal3'
				with: [ spec repository: 'github://ObjectProfile/Roassal3' ];
				baseline: 'Roassal3Exporters'
				with: [ 
					spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
				baseline: 'MooseAlgos'
				with: [ 
					spec repository: 'github://moosetechnology/MooseAlgos:v1.1.8' ].

			spec package: 'Kendrick-Core' with: [ 
				spec requires:
					#( 'DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal3'
					   'Roassal3Exporters' 'MooseAlgos' ) ] ];
		package: 'Kendrick-DSL'
		with: [ spec requires: #( 'Kendrick-Core' ) ];
		package: 'Kendrick-Tests'
		with: [ spec requires: #( 'Kendrick-Core' 'Kendrick-DSL' ) ];
		package: 'Kendrick-Examples'
		with: [ spec requires: #( 'Kendrick-Core' 'Kendrick-DSL' ) ].

	spec
		for: #( 'pharo9.x' 'pharo10.x' ) do: [ 
			spec
				baseline: 'PetitParser2Core'
				with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
				with: [ 
					spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Ston'
				with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'Roassal3Exporters'
				with: [ 
					spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
				baseline: 'CollectionExtensions' with: [ 
					spec repository:
							'github://pharo-contributions/CollectionExtensions:v1.x.x/src' ];
				baseline: 'AIGraphAlgorithms' with: [ 
					spec
						repository: 'github://pharo-ai/graph-algorithms:v1.0.0';
						loads: 'GraphGeneratorsTests' ].
			spec package: 'Kendrick-Core' with: [ 
				spec requires:
					#( 'DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'CollectionExtensions'
					   'AIGraphAlgorithms' 'Roassal3Exporters' ) ] ];
		package: 'Kendrick-DSL'
		with: [ spec requires: #( 'Kendrick-Core' ) ];
		package: 'Kendrick-Tests'
		with: [ spec requires: #( 'Kendrick-Core' 'Kendrick-DSL' ) ];
		package: 'Kendrick-Examples'
		with: [ spec requires: #( 'Kendrick-Core' 'Kendrick-DSL' ) ];
		package: 'Kendrick2-Automata'
		with: [ spec requires: #( 'Kendrick-Core' ) ]
]

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
		spec repository: 'https://github.com/UMMISCO/Kendrick'.
		spec
			baseline: 'PolyMath' with: [ 
				spec
					repository: 'github://PolyMathOrg/PolyMath';
					loads: 'Core' ];
			baseline: 'DataFrame'
			with: [ spec repository: 'github://PolyMathOrg/DataFrame:v2.0' ].

		spec group: 'default' with: #( #Kendrick ) ].

	spec for: #'pharo8.x' do: [ 
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

		spec package: 'Kendrick' with: [ 
			spec requires:
				#( 'DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal3'
				   'Roassal3Exporters' 'MooseAlgos' ) ] ].
	spec for: #'pharo9.x' do: [ 
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
		spec package: 'Kendrick' with: [ 
			spec requires:
				#( 'DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'CollectionExtensions'
				   'AIGraphAlgorithms' 'Roassal3Exporters'  ) ] ]
]

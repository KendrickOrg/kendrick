Class {
	#name : #BaselineOfKendrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfKendrick
}

{ #category : #baselines }
BaselineOfKendrick >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'https://github.com/UMMISCO/Kendrick'.
			spec
				baseline: 'PolyMath'
					with: [ spec
						repository: 'github://PolyMathOrg/PolyMath/src';
						loads: 'Core' ];
				baseline: 'DataFrame'
					with: [ spec repository: 'github://PolyMathOrg/DataFrame:v2.0/src' ];
				baseline: 'MooseAlgos'
					with: [ spec repository: 'github://moosetechnology/MooseAlgos:v1.1.8/src' ].
			spec group: 'default' with: #(#Kendrick) ].
	
	spec
		for: #'pharo8.x'
		do: [ spec
				baseline: 'PetitParser2Core'
					with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
					with: [ spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Ston'
					with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'Roassal3'
					with: [ spec repository: 'github://ObjectProfile/Roassal3' ];
				baseline: 'Roassal3Exporters'
					with: [ spec repository: 'github://ObjectProfile/Roassal3Exporters' ];
				baseline: 'GToolkitExamples'
					with: [ spec repository: 'github://feenkcom/gtoolkit-examples/src' ].
					
			spec
				package: 'Kendrick'
				with: [ spec
						requires:
							#('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal3' 'Roassal3Exporters' 'MooseAlgos' 'GToolkitExamples') ] ].
	spec
		for: #'pharo9.x'
		do: [ spec
				baseline: 'PetitParser2Core'
					with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
					with: [ spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Ston'
					with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'GToolkitExamples'
					with: [ spec repository: 'github://feenkcom/gtoolkit-examples/src' ].
			spec
				package: 'Kendrick'
				with: [ spec
						requires: #('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'MooseAlgos' 'GToolkitExamples') ] ]
]

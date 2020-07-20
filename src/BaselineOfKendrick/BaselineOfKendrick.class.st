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
				package: 'CollectionExtensions'
					with: [ spec
						repository: 'http://smalltalkhub.com/mc/Moose/CollectionExtensions/main/' ];
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
		for: #'pharo6.x'
		do: [ spec
				project: 'Roassal2'
					with: [ spec
						className: #ConfigurationOfRoassal2;
						versionString: '1.59';
						repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];
				project: 'PetitParser'
					with: [ spec
						className: #ConfigurationOfPetitParser;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
				project: 'Ston'
					with: [ spec
						className: #ConfigurationOfSton;
						versionString: #stable;
						repository: 'http://ss3.gemstone.com/ss/STON' ].
			spec
				package: 'Kendrick'
				with: [ spec
						requires:
							#('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal2' 'CollectionExtensions' 'MooseAlgos') ] ].
	spec
		for: #'pharo7.x'
		do: [ spec
				baseline: 'PetitParser2Core'
					with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
					with: [ spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Roassal2'
					with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ];
				baseline: 'Ston'
					with: [ spec repository: 'github://svenvc/ston/repository' ].
			spec
				package: 'Kendrick'
				with: [ spec
						requires:
							#('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal2' 'CollectionExtensions' 'MooseAlgos') ] ].
	spec
		for: #'pharo8.x'
		do: [ spec
				baseline: 'PetitParser2Core'
					with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
					with: [ spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Roassal2'
					with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ];
				baseline: 'Ston'
					with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'Roassal3'
					with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
			spec
				package: 'Kendrick'
				with: [ spec
						requires:
							#('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal2' 'Roassal3' 'CollectionExtensions' 'MooseAlgos') ] ].
	spec
		for: #'pharo9.x'
		do: [ spec
				baseline: 'PetitParser2Core'
					with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'PetitParser'
					with: [ spec repository: 'github://moosetechnology/PetitParser/src' ];
				baseline: 'Roassal2'
					with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ];
				baseline: 'Ston'
					with: [ spec repository: 'github://svenvc/ston/repository' ];
				baseline: 'Roassal3'
					with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
			spec
				package: 'Kendrick'
				with: [ spec
						requires:
							#('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal2' 'Roassal3' 'CollectionExtensions' 'MooseAlgos') ] ]
]

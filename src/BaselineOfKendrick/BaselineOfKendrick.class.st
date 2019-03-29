Class {
	#name : #BaselineOfKendrick,
	#superclass : #BaselineOf,
	#category : 'BaselineOfKendrick'
}

{ #category : #baselines }
BaselineOfKendrick >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'https://github.com/UMMISCO/Kendrick'.
			spec
				package: 'CollectionExtensions' with: [ spec repository: 'http://smalltalkhub.com/mc/Moose/CollectionExtensions/main/' ];
				project: 'PetitParser'
					with: [ spec
						className: #ConfigurationOfPetitParser;
						versionString: #development;
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
				baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ];
				baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame:master/src' ].
			spec
				package: 'Kendrick'
				with: [ spec requires: #('DataFrame' 'PolyMath' 'Ston' 'PetitParser' 'Roassal2' 'CollectionExtensions') ].
			spec group: 'default' with: #(#Kendrick) ].
	spec
		for: #'pharo6.x'
		do: [ spec
				project: 'Roassal2'
					with: [ spec
						className: #ConfigurationOfRoassal2;
						versionString: '1.59';
						repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];
				project: 'Ston'
					with: [ spec
						className: #ConfigurationOfSton;
						versionString: #stable;
						repository: 'http://ss3.gemstone.com/ss/STON' ] ].
	spec
		for: #'pharo7.x'
		do: [ spec
				baseline: 'PetitParser2Core' with: [ spec repository: 'github://kursjan/petitparser2' ];
				baseline: 'Roassal2' with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ];
				baseline: 'Ston' with: [ spec repository: 'github://svenc/ston/repository' ] ]
]

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
		do: [
			spec blessing: #baseline.
			spec repository: 'https://github.com/UMMISCO/Kendrick'.
			spec
				baseline: 'PetitParser2Core'
    					with: [ spec repository: 'github://kursjan/petitparser2' ];
				project: 'PetitParser' with: [
					spec
						className: #ConfigurationOfPetitParser;
						versionString: #'development';
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
"				project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];"
				baseline: 'PolyMath'
    					with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ];
				baseline: 'DataFrame'
						with: [ spec repository: 'github://PolyMathOrg/DataFrame:master/' ];
				project: 'Ston'
					with: [ spec
						className: #ConfigurationOfSton;
						versionString: #stable;
						repository: 'http://ss3.gemstone.com/ss/STON' ].
			spec package: 'Kendrick' with: [ spec requires: #('DataFrame' 'PolyMath' 'Ston' 'PetitParser')].
			spec group: 'default' with: #(#Kendrick) ]

]

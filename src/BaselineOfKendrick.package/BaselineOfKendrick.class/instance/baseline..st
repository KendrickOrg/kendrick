baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec blessing: #baseline.
			spec repository: 'https://github.com/UMMISCO/Kendrick'.
			spec
				project: 'PetitParser' with: [
					spec
						className: #ConfigurationOfPetitParser;
						versionString: #'development';
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
				project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];
				baseline: 'PolyMath'
    					with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ];
				project: 'Ston'
					with: [ spec
						className: #ConfigurationOfSton;
						versionString: #stable;
						repository: 'http://ss3.gemstone.com/ss/STON' ];
				project: 'Glamour'
					with: [ spec
						className: #ConfigurationOfGlamour;
						versionString: #stable;
						loads: #('Glamour-Magritte-Presentations');
						repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ].
			spec package: 'Kendrick' with: [ spec requires: #('Roassal2' 'PolyMath' 'Ston' 'Glamour' 'PetitParser')].
			spec group: 'default' with: #(#Kendrick) ]
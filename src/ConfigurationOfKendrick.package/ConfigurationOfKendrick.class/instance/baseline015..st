baselines
baseline015: spec
	<version: '0.15-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec 
			project: 'Glamour' with: [
				spec
					className: #ConfigurationOfGlamour;
					versionString: #'stable';
					loads: #('Glamour-Magritte-Presentations' );
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ];
			project: 'MooseAlgosGraphGenerators' with: [
				spec
					className: #ConfigurationOfMooseAlgosGraphGenerators;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/SergeStinckwich/Moose-Algos-Graph-Generators/main/' ];
    		baseline: 'PolyMath' with: [
			spec
				repository: 'github://PolyMathOrg/PolyMath:master/src' ];
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: '0.19';
					repository: 'http://ss3.gemstone.com/ss/STON' ].
		spec package: 'Kendrick'. ]

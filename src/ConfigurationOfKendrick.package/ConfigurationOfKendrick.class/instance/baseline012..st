baselines
baseline012: spec
	<version: '0.12-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/';
			repository: 'http://smalltalkhub.com/mc/SergeStinckwich/Moose-Algos-Graph-Generators/main'.
		spec
			project: 'PolyMath' with: [
				spec
					className: #ConfigurationOfPolyMath;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/PolyMath/PolyMath/main' ];
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: #'stable';
					repository: 'http://ss3.gemstone.com/ss/STON' ];
			project: 'Glamour' with: [
				spec
					className: #ConfigurationOfGlamour;
					versionString: #'stable';
					loads: #('Glamour-Magritte-Presentations' );
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ].
		spec package: 'Moose-Algos-Graph-Generators'.
		spec package: 'Kendrick'. ]
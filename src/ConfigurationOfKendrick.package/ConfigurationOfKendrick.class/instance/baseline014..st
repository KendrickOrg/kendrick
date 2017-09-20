baselines
baseline014: spec
	<version: '0.14-baseline'>

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
			project: 'PolyMath' with: [
				spec
					className: #ConfigurationOfPolyMath;
					versionString: '0.40-baseline';
					repository: 'http://smalltalkhub.com/mc/PolyMath/PolyMath/main' ];
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: '0.19';
					repository: 'http://ss3.gemstone.com/ss/STON' ].
		spec package: 'Kendrick'. ].

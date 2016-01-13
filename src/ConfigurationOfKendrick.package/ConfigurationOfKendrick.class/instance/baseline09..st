baselines
baseline09: spec
	<version: '0.9-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec 
			project: 'Moose' with: [
				spec
					className: #ConfigurationOfMoose;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Moose/main/' ];
			project: 'SciSmalltalk' with: [
				spec
					className: #ConfigurationOfSciSmalltalk;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/' ];
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
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ];
			project: 'VirtualGPU' with: [
				spec
					className:#ConfigurationOfVirtualGPU;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/ronsaldo/VirtualGPU/main'].
		spec package: 'Kendrick'. ].

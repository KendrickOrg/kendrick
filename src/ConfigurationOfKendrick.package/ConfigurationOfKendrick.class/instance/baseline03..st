baselines
baseline03: spec
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec project: 'Moose' with: [
				spec
					className: #ConfigurationOfMoose;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Moose/main/' ].
		spec project: 'SciSmalltalk' with: [
				spec
					className: #ConfigurationOfSciSmalltalk;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/' ].
		spec 
			package: 'Kendrick'].

baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec 
			project: 'GraphET' with: [
				spec
					className: #ConfigurationOfGraphET;
					versionString: 'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/GraphET/main/' ];
			project: 'Fame' with: [
				spec
					className: #ConfigurationOfFame;
					versionString: 'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/Moose/Fame/main/' ].
		spec package: 'Kendrick'. ].

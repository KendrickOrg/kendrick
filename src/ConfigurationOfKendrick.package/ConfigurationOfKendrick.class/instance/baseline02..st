baselines
baseline02: spec
	<version: '0.2-baseline'>

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
					repository: 'http://smalltalkhub.com/mc/Moose/Fame/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
		spec package: 'Kendrick'. ].

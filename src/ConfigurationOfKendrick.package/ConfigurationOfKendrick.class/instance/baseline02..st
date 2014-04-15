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
					versionString: '0.3-snapshot';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/GraphET/main/' ];
			project: 'Fame' with: [
				spec
					className: #ConfigurationOfFame;
					versionString: '1.5-snapshot';
					repository: 'http://smalltalkhub.com/mc/Moose/Fame/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.8-snapshot';
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'Glamour' with: [
				spec
					className: #ConfigurationOfGlamour;
					versionString: '2.6-snapshot';
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ].
		spec package: 'Kendrick'. ].

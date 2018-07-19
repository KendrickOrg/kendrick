"
ConfigurationOfKendrick is a Metacello Configuration to load the packages of the Kendrick project.

Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

Kendrick is based extensively on several tools of the meta-modeling platform MOOSE including PetitParser and Graph-ET.

Github is only used to to store the issues list: https://github.com/UMMISCO/Kendrick/issues?state=open
"
Class {
	#name : #ConfigurationOfKendrick,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfKendrick'
}

{ #category : #'development support' }
ConfigurationOfKendrick class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfKendrick class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #'development support' }
ConfigurationOfKendrick class >> catalogContactInfo [
	^ 'Serge Stinckwich <serge.stinckwich@gmail.com>'
]

{ #category : #'development support' }
ConfigurationOfKendrick class >> catalogDescription [
	^ 'Kendrick is a platform for epidemiological modeling and analysis. It helps epidemiologists craft custom analyses cheaply. It''s based on Pharo and MOOSE. It''s open source under BSD/MIT.More info on: http://ummisco.github.io/kendrick/'
]

{ #category : #'development support' }
ConfigurationOfKendrick class >> catalogKeywords [
	^ #('simulation' 'epidemiology' 'Roassal')
]

{ #category : #private }
ConfigurationOfKendrick class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfKendrick class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfKendrick class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfKendrick class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfKendrick class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfKendrick class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #loading }
ConfigurationOfKendrick class >> loadDevelopmentForMoose [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #developmentForMoose) load
]

{ #category : #accessing }
ConfigurationOfKendrick class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfKendrick class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline010: spec [
	<version: '0.10-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec
			project:'Moose' with:[
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
					repository: 'http://ss3.gemstone.com/ss/STON' ].
			"project: 'Glamour' with: [
				spec
					className: #ConfigurationOfGlamour;
					versionString: #'stable';
					loads: #('Glamour-Magritte-Presentations' );
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ]."
		spec package: 'Kendrick'. ].
		
	
]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline011: spec [
	<version: '0.11-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec
			project: 'SciSmalltalk' with: [
				spec
					className: #ConfigurationOfSciSmalltalk;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/' ];
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: #'stable';
					repository: 'http://ss3.gemstone.com/ss/STON' ].
		spec package: 'Kendrick'. ].
		
	
]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline012: spec [
	<version: '0.12-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec
			repository: 'http://smalltalkhub.com/mc/SergeStinckwich/Moose-Algos-Graph-Generators/main';
			repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
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
		spec package: 'Kendrick'. ]
]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline013: spec [
	<version: '0.13-baseline'>

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
		spec 
			package: 'Kendrick' with: [
				spec requires: #(#'Moose-Algos-Graph-Generators' ). ];
			package: #'Moose-Algos-Graph-Generators'. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline014: spec [
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

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline015: spec [
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

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec 
			project: 'Fame' with: [
				spec
					className: #ConfigurationOfFame;
					versionString: 'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/Moose/Fame/main/' ];
			project: 'GraphET' with: [
				spec
					className: #ConfigurationOfGraphET;
					versionString: 'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/GraphET/main/' ].
		spec package: 'Kendrick'. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main/'.
		spec project: 'Moose' with: [
				spec
					className: #ConfigurationOfMoose;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Moose/main/' ].
		spec package: 'Kendrick'. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline03: spec [
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

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline04: spec [
	<version: '0.4-baseline'>

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
		spec project: 'Ston' with: [ 
					spec
					className: #ConfigurationOfSton;
					versionString: #'stable';
					repository:'http://ss3.gemstone.com/ss/STON'].
		spec 
			package: 'Kendrick'].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline05: spec [
	<version: '0.5-baseline'>

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
					repository: 'http://ss3.gemstone.com/ss/STON' ].
		spec 
			package: 'Kendrick';
			package: 'Glamour-Magritte-Presentations'. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline06: spec [
	<version: '0.6-baseline'>

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
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ].
		spec 
			package: 'Kendrick';
			package: 'Glamour-Magritte-Presentations' with: [
				spec requires: #('Glamour' ). ]. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline07: spec [
	<version: '0.7-baseline'>

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
					repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/' ].
		spec package: 'Kendrick'. ].

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline08: spec [
	<version: '0.8-baseline'>

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

]

{ #category : #baselines }
ConfigurationOfKendrick >> baseline09: spec [
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

]

{ #category : #catalog }
ConfigurationOfKendrick >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ '- Version number - Date - topics
[[[
	ConfigurationOfXXX project version: ''xx'' ) load					
]]]
or simply
- Version number - Date - topics
- Version number - Date - topics
- Version number - Date - topics.'
]

{ #category : #catalog }
ConfigurationOfKendrick >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ 'You will more information about the Kendrick project on this website: http://ummisco.github.io/kendrick/'
]

{ #category : #catalog }
ConfigurationOfKendrick >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling.
Kendrick is based extensively on several tools of the meta-modeling platform MOOSE including PetitParser and ROASSAL visualisation engine.'
]

{ #category : #catalog }
ConfigurationOfKendrick >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ 'MyProject is composed of one cool key class named ==MyProject==. There is also ==MyKeyHelper==
- ==MyProject== is the responsible for many cool aspects.
- ==MyKeyHelper== is helping ==MyProject=='
]

{ #category : #catalog }
ConfigurationOfKendrick >> catalogKeywords [
	"Returns an array of symbols"
	^ #(epidemiology science) 
]

{ #category : #accessing }
ConfigurationOfKendrick >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfKendrick >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.15-baseline'.

]

{ #category : #'symbolic versions' }
ConfigurationOfKendrick >> developmentForMoose: spec [
	<symbolicVersion: #'developmentForMoose'>

	spec for: #'common' version: '0.11-baseline'.

]

{ #category : #accessing }
ConfigurationOfKendrick >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfKendrick >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.49'.

]

{ #category : #versions }
ConfigurationOfKendrick >> version010: spec [
	<version: '0.10' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.10 - All green tests'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/22/2014 12:30'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BUIThiMaiAnh.272']

]

{ #category : #versions }
ConfigurationOfKendrick >> version011: spec [
	<version: '0.11' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.11'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/30/2014 16:40'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.282']

]

{ #category : #versions }
ConfigurationOfKendrick >> version012: spec [
	<version: '0.12' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.12'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '10/09/2014 15:07'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BUIThiMaiAnh.287']

]

{ #category : #versions }
ConfigurationOfKendrick >> version013: spec [
	<version: '0.13' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.13'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '10/16/2014 11:35'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.306']

]

{ #category : #versions }
ConfigurationOfKendrick >> version014: spec [
	<version: '0.14' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.14'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2014-11-24T18:21:19.244195+01:00'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.10'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.307']

]

{ #category : #versions }
ConfigurationOfKendrick >> version015: spec [
	<version: '0.15' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.15'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '3/23/2015 16:34'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.10'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.363'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version016: spec [
	<version: '0.16' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.16'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/22/2015 17:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.364'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version017: spec [
	<version: '0.17' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.17'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/28/2015 22:05'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12'.
		spec 
			package: 'Kendrick' with: 'Kendrick-AlvaroJosePeraltaOcampo.366';
			package: 'Glamour-Magritte-Presentations' with: 'Glamour-Magritte-Presentations-AndreiChis.7'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version018: spec [
	<version: '0.18' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.18'.
		spec author: 'AlvaroJosePeraltaOcampo'.
		spec timestamp: '4/29/2015 16:31'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.0.8'.
		spec package: 'Kendrick' with: 'Kendrick'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version019: spec [
	<version: '0.19' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.19'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/08/2015 18:09'.
		spec 
			project: 'Moose' with: '5.1-baseline';
			project: 'SciSmalltalk' with: '0.17-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.373'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version020: spec [
	<version: '0.20' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.20'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/27/2015 10:22'.
		spec 
			project: 'Moose' with: '5.1-baseline';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.377'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version021: spec [
	<version: '0.21' imports: #('0.8-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.21'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/1/2015 10:05'.
		spec 
			project: 'Moose' with: '5.1-baseline';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with:'0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.383'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version022: spec [
	<version: '0.22' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.22'.
		spec author: 'cheikhou'.
		spec timestamp: '6/16/2015 11:16'.
		spec 
			project: 'Moose' with: '5.1';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with:'0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-cheikhouka.398'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version023: spec [
	<version: '0.23' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.23'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/23/2015 11:54'.
		spec 
			project: 'Moose' with: '5.1';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with:'0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.422'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version024: spec [
	<version: '0.24' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.24'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '11/4/2015 16:12'.
		spec 
			project: 'Moose' with: '5.1';
			project: 'SciSmalltalk' with: '0.25-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.451'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version025: spec [
	<version: '0.25' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.25'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '13/1/2015 10:13'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.26-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.451'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version026: spec [
	<version: '0.26' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.26'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '13/1/2015 13:57'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.451'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version027: spec [
	<version: '0.27' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.27'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '13/1/2015 14:12'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.471'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version028: spec [
	<version: '0.28' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.28'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '17/1/2015 18:49'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.472'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version029: spec [
	<version: '0.29' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.29'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '18/1/2015 18:27'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.474'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version02: spec [
	<version: '0.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.2'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/15/2014 15:25'.
		spec project: 'Moose' with: '5.0-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version030: spec [
	<version: '0.30' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.30'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '21/1/2015 8:10'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.476'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version031: spec [
	<version: '0.31' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.31'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '31/1/2015 17:23'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.485'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version032: spec [
	<version: '0.32' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.32'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '2016-03-12T15:46:39.687573+01:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.42';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.485'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version033: spec [
	<version: '0.33' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.33'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '2016-03-15T10:48:56.227108+00:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.42';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.503'. ]

]

{ #category : #versions }
ConfigurationOfKendrick >> version034: spec [
	<version: '0.34' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.34'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/27/2016 12:29'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.28-baseline';
			project: 'Ston' with: '0.19';
			project: 'Glamour' with: '3.3.2'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.525'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version035: spec [
	<version: '0.35' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.35'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '8/29/2016 15:57'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.29-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.532'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version036: spec [
	<version: '0.36' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.36'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-10-11T16:40:24.692661+02:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.29-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.536'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version037: spec [
	<version: '0.37' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.37'.
			spec author: 'SergeStinckwich'.
			spec timestamp: '2016-10-18T16:10:42.307984+02:00'.
			spec
				project: 'Moose' with: '6.0-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.537' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version038: spec [
	<version: '0.38' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.38'.
			spec
				project: 'Moose' with: '6.0-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-NickPapoulias.541' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version039: spec [
	<version: '0.39' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.39'.
			spec
				project: 'Moose' with: '6.0-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-NickPapoulias.572' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version03: spec [
	<version: '0.3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/16/2014 14:34'.
		spec project: 'Moose' with: '5.0-baseline'.
		spec project: 'SciSmalltalk' with: '0.8'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187' ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version040: spec [
	<version: '0.40' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.40'.
			spec
				project: 'Moose' with: '6.1-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.574' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version041: spec [
	<version: '0.41' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.41'.
			spec
				project: 'Moose' with: '6.1-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-NickPapoulias.579' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version042: spec [
	<version: '0.42' imports: #('0.11-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.42'.
			spec
				"project: 'Moose' with: '6.1-baseline';"
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-NickPapoulias.597' ]
]

{ #category : #versions }
ConfigurationOfKendrick >> version043: spec [
	<version: '0.43' imports: #('0.12-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.43'.
			spec
				"project: 'Moose' with: '6.1-baseline';"
				project: 'PolyMath' with: '0.40-baseline';
				project: 'Ston' with: '0.19'.
				spec package: 'Moose-Algos-Graph-Generators' with: 'Moose-Algos-Graph-Generators-SergeStinckwich.41'. 
			spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.682'.
]
]

{ #category : #versions }
ConfigurationOfKendrick >> version044: spec [
	<version: '0.44' imports: #('0.13-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.44'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 13:40'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.683';
			package: #'Moose-Algos-Graph-Generators' with: 'Moose-Algos-Graph-Generators-SergeStinckwich.41'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version045: spec [
	<version: '0.45' imports: #('0.13-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.45'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 14:05'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.698';
			package: #'Moose-Algos-Graph-Generators' with: 'Moose-Algos-Graph-Generators-SergeStinckwich.41'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version046: spec [
	<version: '0.46' imports: #('0.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.46'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 14:55'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.698'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version047: spec [
	<version: '0.47' imports: #('0.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.47'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 15:23'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.699'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version048: spec [
	<version: '0.48' imports: #('0.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.48'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 16:42'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.702'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version049: spec [
	<version: '0.49' imports: #('0.15-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.49'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2018-07-13T14:40:34.596444+01:00'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			baseline: 'PolyMath';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.702'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version04: spec [
	<version: '0.4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/16/2014 17:01'.
		spec project: 'Moose' with: '5.0-baseline'.
		spec project: 'SciSmalltalk' with: '0.9'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187' ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version05: spec [
	<version: '0.5' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/25/2014 00:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.9'.
		spec package: 'Kendrick' with: 'Kendrick-FabriceATREVI.189'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version06: spec [
	<version: '0.6' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.6'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/17/2014 00:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.9'.
		spec package: 'Kendrick' with: 'Kendrick-ATREVIFabrice.196'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version07: spec [
	<version: '0.7' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.7'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/18/2014 00:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.9'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.197'. ].

]

{ #category : #versions }
ConfigurationOfKendrick >> version08: spec [
	<version: '0.8' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '7/24/2014 16:33'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.12'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.197']

]

{ #category : #versions }
ConfigurationOfKendrick >> version09: spec [
	<version: '0.9' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.9'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/19/2014 13:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.269']

]

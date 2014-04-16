* Last stable version (0.4): [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=Kendrick/PHARO=30,VERSION=stable,VM=vm)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=30,VERSION=stable,VM=vm/)
* Last dev version: [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=Kendrick/PHARO=30,VERSION=development,VM=vm)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=30,VERSION=development,VM=vm/)

Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Graph-ET.

Github is only used to sync the development en files, for doing [CI](https://travis-ci.org/SergeStinckwich/Kendrick) and store the [issues](https://github.com/UMMISCO/Kendrick/issues) list.

## How to install Kendrick 0.4
* Download the last dev MOOSE 5.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-5.0/
* Load Kendrick:

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    package: 'ConfigurationOfKendrick';
    load.
  ((Smalltalk at: #ConfigurationOfKendrick) project version: '0.4') load.
````

## How to install Kendrick development version
* Download the last dev MOOSE 5.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-5.0/
* Load Kendrick:

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    package: 'ConfigurationOfKendrick';
    load.
  (Smalltalk at: #ConfigurationOfKendrick) loadDevelopment.
````


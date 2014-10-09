Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. It helps epidemiologists craft custom analyses cheaply. It's based on [Pharo](http://www.pharo.org/) and it's open source under MIT.

Kendrick is member of Moose4Ebola team for [Ebola Challenge](https://www.hackerleague.org/hackathons/computing-for-ebola-challenge/hacks/moose4ebola).

* Last stable version (0.11): [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=Kendrick/PHARO=30,VERSION=stable,VM=vm)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=30,VERSION=stable,VM=vm/)
* Last dev version: [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=Kendrick/PHARO=30,VERSION=development,VM=vm)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=30,VERSION=development,VM=vm/)

All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

[![Spatial modeling with Kendrick](https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-xpa1/t31.0-8/10603924_704650679621532_369168494419506567_o.png)](https://www.facebook.com/ObjectProfile/photos/a.341189379300999.82969.340543479365589/704650679621532/?type=1&theater)

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Graph-ET.

Github is only used to to store the [issues](https://github.com/UMMISCO/Kendrick/issues) list.

## How to install Kendrick 0.11
* Download the last dev MOOSE 5.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-5.0/
* Load Kendrick:

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    package: 'ConfigurationOfKendrick';
    load.
((Smalltalk at: #ConfigurationOfKendrick) project version: '0.11') load.
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


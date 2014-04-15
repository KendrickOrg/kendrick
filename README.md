Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Graph-ET.

Github is only used to sync the development en files, for doing [CI](https://travis-ci.org/SergeStinckwich/Kendrick) and store the [issues](https://github.com/UMMISCO/Kendrick/issues) list.

Last stable version : 0.2
## How to install Kendrick 0.2

* Download the last dev MOOSE 5.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-5.0/
* Load Kendrick:

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    package: 'ConfigurationOfKendrick';
    load.
  ((Smalltalk at: #ConfigurationOfKendrick) project version: '0.2') load.
````


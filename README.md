[![Stories in Ready](https://badge.waffle.io/UMMISCO/kendrick.png?label=ready&title=Ready)](https://waffle.io/UMMISCO/kendrick)
[![Join the chat at https://gitter.im/UMMISCO/kendrick](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/UMMISCO/kendrick?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/UMMISCO/kendrick/master/LICENSE)

Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. It helps epidemiologists craft custom analyses cheaply. It's based on [Pharo](http://www.pharo.org/) and it's open source under MIT.

Kendrick was involved in the Moose4Ebola team for [Ebola Challenge](https://www.hackerleague.org/hackathons/computing-for-ebola-challenge/hacks/moose4ebola).

* Last stable version (0.31) on Pharo 5.0: [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=Kendrick/PHARO=50,VERSION=stable,VM=vm)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=50,VERSION=stable,VM=vm/)
* Last dev version on Pharo 5.0: [![Build Status](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=50,VERSION=development,VM=vm/badge/icon)](https://ci.inria.fr/pharo-contribution/job/Kendrick/PHARO=50,VERSION=development,VM=vm/)

All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

[![Spatial modeling with Kendrick](https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-xpa1/t31.0-8/10603924_704650679621532_369168494419506567_o.png)](https://www.facebook.com/ObjectProfile/photos/a.341189379300999.82969.340543479365589/704650679621532/?type=1&theater)

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Roassal visualization engine.

Github is only used to store [issues](https://github.com/UMMISCO/Kendrick/issues) list.

## How to install Kendrick 0.31
* Download a Spur VM: https://ci.inria.fr/pharo/view/5.0-VM-Spur/job/PharoVM-spur32/
* Download the last dev MOOSE 6.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-6.0/
* Load Kendrick: Open MOOSE 6.0 image with the Spur VM then right-click anywhere to open the main menu. Choose Playground to execute scripts. Paste the script below in Playground, select all then right-click and choose Do it to execute this.

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    configurationOf:'Kendrick';
    loadVersion:'0.31'.
````

## How to install Kendrick development version
* Download a Spur VM: https://ci.inria.fr/pharo/view/5.0-VM-Spur/job/PharoVM-spur32/
* Download the last dev MOOSE 6.0 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-6.0/
* Load Kendrick: the instructions to load the development version of Kendrick is similar. The script is below:

```Smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    package: 'ConfigurationOfKendrick';
    load.
(Smalltalk at: #ConfigurationOfKendrick) loadDevelopment
````


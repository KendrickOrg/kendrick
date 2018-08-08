[![Build Status](https://travis-ci.org/UMMISCO/kendrick.svg?branch=master)](https://travis-ci.org/UMMISCO/kendrick)
[![Build status](https://ci.appveyor.com/api/projects/status/0wy09lhcta0017ri?svg=true)](https://ci.appveyor.com/project/SergeStinckwich/kendrick)
[![Coverage Status](https://coveralls.io/repos/github/UMMISCO/kendrick/badge.svg?branch=master)](https://coveralls.io/github/UMMISCO/kendrick?branch=master)

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/UMMISCO/kendrick/master/LICENSE)

Kendrick provide a Domain-Specific Language and a Simulation Plaform for mathematical epidemiology modeling. It helps epidemiologists craft custom analyses cheaply. It's based on [Pharo](http://www.pharo.org/) and it's open source under MIT. Classes of epidemic model include deterministic compartmental models, stochastic individual contact models, and individual-based network models.

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Roassal visualization engine.

## Citation

If you are using Kendrick for research, please cite our work as:
> BUI Thi Mai Anh, Mikal Ziane, Serge Stinckwich, HO Tuong Vinh, Benjamin Roche, Nick Papoulias (2016). *Separation of Concerns in Epidemiological Modelling*, Companion Proceedings of the 15th International Conference on Modularity, pages 196-200 URL: http://dl.acm.org/citation.cfm?id=2892699

## Documentation
You will find documentation about Kendrick DSL in the wiki : https://github.com/UMMISCO/kendrick/wiki

Kendrick is also described in a chapter of the [Agile Visualization book](http://agilevisualization.com/).

## How to install a stable version of Kendrick

If you don't want to compile Kendrick on your machine, you can download pre-compiled versions of Kendrick for your platform of choice, follow the links below:

* [Kendrick-0.42-Mac](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Mac.zip) (Double-click or invoke **KendrickUI** from bash)
* [Kendrick-0.42-Linux](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Linux.zip) (Double-click or invoke **KendrickUI** from bash -- For prerequisites see: [Pharo-Linux](https://pharo.org/gnu-linux-installation) and below)
* [Kendrick-0.42-Windows](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Windows.zip) (Double-click **KendrickWinLauncher** or invoke **KendrickUI from cygwin**)

**Ubuntu and Debian-based systems, 32-bit libraries setup:**

* apt-get -qq update
* apt-get -y install wget
* apt-get -y install unzip
* dpkg --add-architecture i386 
* apt-get update 
* apt-get -y install libx11-6:i386 
* apt-get -y install libgl1-mesa-glx:i386 
* apt-get -y install libfontconfig1:i386 
* apt-get -y install libssl1.0.0:i386 

You can also install Kendrick 0.42 from source files. On systems with a bash cmd-line (this includes Linux, Mac and Windows with Cygwin and/or the Windows 10 Bash sub-system), you can compile Kendrick from sources using the following command:
```shell
wget -O- https://goo.gl/WUQxmp | bash
````

## How to install the development version of Kendrick from github

* Download Pharo 6.1 VM depending of your platform: http://pharo.org/download
* Load Kendrick: Open Pharo 6.1 image then right-click anywhere to open the main menu. Choose Playground to execute script. Paste the script below in Playground, select all then right-click and choose Do it to execute this.

```Smalltalk
Metacello new
        repository: 'github://UMMISCO/kendrick:master/src';
        baseline: 'Kendrick';
        load
```
## How to invoke Kendrick

### DSL Editor
After compiling from source or downloading the pre-compiled versions of Kendrick, you can run the 
dedicated Kendrick editor (using the Kendrick DSL), by invoking:
```shell
./KendrickUI
```

### Development Environmement

To run Kendrick with the full Pharo environment (allowing to use both the DSL and the Pharo API of Kendrick),
you can invoke:
```shell
./KendrickDevUI
```

### Using External Tools

Finally, to use Kendrick with an editor of your choice, you only need to navigate in the Sources directory
of your installation, edit / add files for your project and invoke the non-interactive kendric executable 
as follows (example for simulating and visualizing the results described in Influenza1Viz.kendrick):
```shell
./Kendrick Sources/Projects/Infuenza/Visualization/Influenza1Viz.kendrick
```

In the above example you can then find the results in: 
```shell
Sources/Projects/Infuenza/Output/Influenza1Viz.png
```

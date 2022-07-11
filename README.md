<p align="center">
<h1 align="center">Kendrick</h1>
  <p align="center">
    DSL and Simulation Plarform for Epidemiology Modeling
    <br>
    <a href="https://github.com/KendrickOrg/kendrick/wiki"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/KendrickOrg/kendrick/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/KendrickOrg/kendrick/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>


[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
![CI](https://github.com/KendrickOrg/kendrick/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/KendrickOrg/kendrick/badge.svg?branch=master)](https://coveralls.io/github/KendrickOrg/kendrick?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/KendrickOrg/kendrick/master/LICENSE)

Kendrick provides an embedded Domain-Specific Language and a Simulation Plaform for mathematical epidemiology modeling. It helps epidemiologists craft custom analyses cheaply. It's based on [Pharo](http://www.pharo.org/) and it's open source under MIT licence. Classes of epidemic model include deterministic compartmental models, stochastic individual contact models, and individual-based network models.

Kendrick is based extensively on several Pharo ecosystem tools including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and [Roassal](http://agilevisualization.com/) visualization engine.

[![Screenshot](images/screenshot.png)](https://raw.githubusercontent.com/KendrickOrg/kendrick/master/images/screenshot.png)

## Citation

If you are using Kendrick for research, please cite our work as:

> Mai Anh BUI T., Nick Papoulias, Serge Stinckwich, Mikal Ziane & Benjamin Roche (2019), *The Kendrick modelling platform: language abstractions and tools for epidemiology*, BMC Bioinformatics volume 20, Article number: 312 URL:
https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-2843-0

## Documentation
You will find documentation about Kendrick meta-model and DSL here: https://github.com/KendrickOrg/kendrick/blob/master/documentation/meta-model/meta-modelv3.org

A previous version of Kendrick is also described in a chapter of the [Agile Visualization book](http://agilevisualization.com/).

## How to install the development version of Kendrick from github

* Download Pharo 10.0 VM depending of your platform: http://pharo.org/download
* Load Kendrick: Open Pharo 10.0 image then right-click anywhere to open the main menu. Choose Playground to execute script. Paste the script below in Playground, select all then right-click and choose Do it to execute this.
* You need first to update the Iceberg version in your image. See CONTRIBUTING.md for more details.

```Smalltalk
Metacello new
        repository: 'github://KendrickOrg/kendrick';
        baseline: 'Kendrick';
        onWarningLog ;
        load
```


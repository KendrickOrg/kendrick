Kendrick is a Domain-Specific Language and Simulation Plaform for mathematical epidemiology modeling. All the development happens on SmalltalkHub: http://bit.ly/XrpsL2


Github is only used to sync the development en files, for doing CI and store the [issues](https://github.com/SergeStinckwich/Kendrick/issues) list.

## How to install Kendrick

* Download the last dev MOOSE 4.7 image : http://ci.moosetechnology.org/job/moose-latest-dev/

* Load last version Kendrick :

```Smalltalk
Gofer iturl: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';package: 'Kendrick';load.````

## How to sync SmalltalkHub repository with github (only for developers)
* Bootstrap FileTree:

```Smalltalk
  Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
  ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
```

* Clone this repository:

```shell
  mkdir Kendrick
  cd Kendrick
  git clone https://github.com/SergeStinckwich/Kendrick.git
```

* Attach to filetree repository and load latest packages (use correct path to your filetree download/clone):

```Smalltalk
repo := 'Add you repo path here'.
Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: repo));
    package: 'Kendrick';
    load.
```

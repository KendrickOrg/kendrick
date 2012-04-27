SqueakSource repository: http://www.squeaksource.com/Kendrick.html

## How to install Kendrick

* Download the last dev MOOSE 4.7 image here: http://ci.moosetechnology.org/job/moose-latest-dev/lastSuccessfulBuild/artifact/moose_suite-4_7_dev.zip

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
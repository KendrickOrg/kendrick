# Contribution Guide for Kendrick

This file is currently not complete but will be improve step by step.

# Update iceberg
In a fresh Pharo 6.1, execute the following script in order to update Iceberg to the last version : 

```Smalltalk
MetacelloPharoPlatform select.
#(
    'BaselineOfTonel'
    'BaselineOfLibGit'
    'BaselineOfIceberg'
    'MonticelloTonel-Core'
    'MonticelloTonel-FileSystem'
    'MonticelloTonel-Tests'
    'Iceberg-UI' 
    'Iceberg-TipUI'
    'Iceberg-Plugin-Pharo' 
    'Iceberg-Plugin-Metacello' 
    'Iceberg-Plugin-GitHub' 
    'Iceberg-Plugin' 
    'Iceberg-Metacello-Integration' 
    'Iceberg-Libgit-Tonel' 
    'Iceberg-Libgit-Filetree' 
    'Iceberg-Libgit' 
    'Iceberg-Tests'
    'Iceberg-Memory'
    'Iceberg-UI-Tests'
    'Iceberg-Core' 
    'Iceberg-Changes' 
    'Iceberg-Adapters' 
    'Iceberg'
    'Iceberg-GitCommand'
    'Iceberg-SmartUI'
    'Iceberg-Pharo6'
    'LibGit-Core') 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].
"update icons (iceberg needs some new)"
ThemeIcons current: ThemeIcons loadDefault.
"load iceberg"
Metacello new
  	baseline: 'Iceberg';
  	repository: 'github://pharo-vcs/iceberg:v1.1.1';
	onWarningLog;
  	load.
"Re-initialize libgit2"
(Smalltalk at: #LGitLibrary) initialize.

"In some case Pharo/Calypso can have a problem with Obsolete classes. If you encounter this problem just execute this command and retry your action:

Smalltalk compilerClass recompileAll

"
```

## Setup Iceberg
You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Fork the Pharo repository

All changes you'll do will be versionned in your own fork of the [Kendrick repository](https://github.com/UMMISCO/kendrick). Then, from your fork you'll be able to issue pull requests to Kendrick, where they will be reviewed, and luckily, integrated.

Go to Kendrick github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to Kendrick.

## Load your fork version of Kendrick in your image:
In your Pharo 6.1 image, load now the last development version of Kendrick : 

```Smalltalk
Metacello new
        onWarningLog;
        githubUser: 'XXX' project: 'kendrick' commitish: 'master' path: 'src';
        baseline: 'Kendrick';
        load
```
where you replace XXX with your github user name.

PS: at the moment, we have only one master branch, so all development happens on this branch. We will use two branches when we release a first version of Kendrick.

## Send the PR to the original Kendrick repo
After doing the modification in your image, open Iceberg tool, commit the changes in your Kendrick repository. Cherry-pick the modifications that you want to include in your commit. In the github interface, create a Pull Request from your commit.
Send the PR to Kendrick main repository.

## Cleanups
Ounce your pull request is integrated, some cleanups are maybe required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

You will need from time to time to sync your fork with the original repo. You can do it on the command line with: https://help.github.com/articles/syncing-a-fork/ or in the browser like : https://github.com/KirstieJane/STEMMRoleModels/wiki/Syncing-your-fork-to-the-original-repository-via-the-browser 
You can also kill and redo a fork very easily.

# Release management (not used at the moment)

This project use semantic versionning to define the releases, meaning that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

- When a release contains only bug fixes, the patch number is incremented;
- When the release contains new backward compatible features, the minor version is incremented;
- When the release contains breaking changes, the major version is incremented. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# Branch management (not used at the moment)

This project uses gitflow management.

This project contains two main branches:
- **master** : This branch is a stable branch. Each version on this branch should be a stable release of Kendrick, and ideally each commit modifying the source code of the project should be tagged with a version number.
- **development** : This branch contains the current development of this project. 

## Hot fix (not used at the moment)

If a bug is found in a stable version and the correction is backward compatible, it should be corrected in an hotfix branch. Once the correction is finished the hotfix branch should be merged into master and development and a new bugfix release should be done.

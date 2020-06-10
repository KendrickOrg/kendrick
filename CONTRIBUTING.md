<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
- [Contribution Guide for Kendrick](#contribution-guide-for-Kendrick)
  - [Setup Iceberg](#setup-iceberg)
  - [Fork the Kendrick repository](#fork-the-kendrick-repository)
  - [Load your fork version of Kendrick in your image](#load-your-fork-version-of-Kendrick-in-your-image)
  - [Add main Kendrick repository as remote](#add-main-kendrick-repository-as-remote)
  - [Send some changes to the original Kendrick repository](#send-some-changes-to-the-original-Kendrick-repository)
      - [From Pharo Iceberg](#from-pharo-iceberg)
      - [From Github UI](#from-github-ui)
  - [Pull changes from original to fork](#pull-changes-from-original-to-fork)
    - [From GitHub GUI](#from-github-gui)
    - [Sync your fork with the Kendrick main repository](#sync-your-fork-with-the-Kendrick-main-repository)
  - [Cleanups](#cleanups)
- [Release management (not used at the moment)](#release-management-not-used-at-the-moment)
- [Branch management (to be defined)](#branch-management-to-be-defined)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Contribution Guide for Kendrick

*This file is currently not complete but will be improve step by step.*

In order to contribute to Kendrick on github we are using Pharo 6.1 and Iceberg.

In Pharo 6.1 on MacOS, there is a font bug with last version of Roassal 2. Before installing Kendrick, you need to update your fonts, by unclick and click on the Use Free Type ... in the settings. This problem with be fixed when we move to Pharo 7.0.

# Update Iceberg (if you are using Pharo 6.1)
Then you need to update Iceberg to the last version, by executing the following script :

```Smalltalk
"Unregister all iceberg repository adapters since we are going to unload all code related to it.
Otherwise obsolete instances will stay".
IceMetacelloRepositoryAdapter allInstances do: #unregister.
Smalltalk globals at: #IceSystemEventListener ifPresent: #unregisterSystemAnnouncements.

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

"Loading Tonel before trying to load Iceberg.
This is required to load iceberg packages and dependencies in Tonel format"
Metacello new
  baseline: 'Tonel';
  repository: 'github://pharo-vcs/tonel:v1.0.12';
  load.

"Updating Metacello"
Metacello new
    baseline: 'Metacello';
    repository: 'github://metacello/metacello:pharo-6.1_dev/repository';
    onConflict: [ :ex | ex allow ];
    load.

"load iceberg"
Metacello new
  	baseline: 'Iceberg';
  	repository: 'github://pharo-vcs/iceberg:v1.5.?';
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

## Fork the Kendrick repository

All changes you'll do will be versionned in your own fork of the [Kendrick repository](https://github.com/UMMISCO/kendrick). Then, from your fork you'll be able to issue pull requests to Kendrick, where they will be reviewed, and luckily, integrated.

Go to Kendrick github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to kendrick.

## Load your fork version of Kendrick in your image

In your Pharo 6.1 image, load now the last development version of Kendrick :

```Smalltalk
Metacello new
        githubUser: 'XXX' project: 'kendrick' commitish: 'master' path: 'src';
        baseline: 'Kendrick';
	onWarningLog;
        load
```
where you replace XXX with your github user name.

PS: at the moment, we have only one master branch, so all development happens on this branch. We will use two branches when we release a first version of Kendrick.

## Add main Kendrick repository as remote

Open Iceberg, open Kendrick repository, click on repositories, then + button (add remote).

Remote name: upstream

Remote URL: https://github.com/UMMISC/kendrick.git

## Send some changes to the original Kendrick repository

#### From Pharo Iceberg

After doing modifications in your image, open Iceberg tool, commit the changes in your Kendrick repository. Cherry-pick the modifications that you want to include in your commit. Then push your commit to your fork. It's more convenient to divide your changes in meaninfull and simple commits, which makes it easier to check for those who need to proofread it.

![iceberge](https://github.com/cormas/cormas/img/iceberg_pharo.png)

#### From GitHub UI

In the GitHub interface, create a Pull Request (PR) from your commit.
You have to give some information about what is the purpose of you pull request. Then submit it to Kendrick main repository.
This will notify Kendrick core developers team that an improvement or bug fix is pending.

![create a pull request from github](img/github_pr.png)

As the main core developers, you have to review the open PRs. When merging the pull request, select *Create a merge commit* not  squash and merge. Try to avoid (except in case of emergency) to review your own commits.

## Pull changes from original to fork

You can proceed in two different ways to update your fork. You can either use github's web interface, or entirely from pharo/Kendrick.

### From GitHub GUI

If at some point, you see than the original Kendrick repository is ahead from your own fork (2 in the following picture) you can synchronize your own repository with all the newest features add to the original using compare (3)

![pull feature in your own](img/github_cp.png)

To compare you can define sources (1) and target (2) for the update. Once it's done, you can use the pull request mechanism (3) to merge the original Kendrick code to your own.

![pull feature in your own with PR](img/github_pr_fork.png)

The last step in this process, you'll just have to go back to your Kendrick Pharo a pull into your Kendrick image in the VM.

### Sync your fork with the Kendrick main repository

After a while, changes from other developers are integrated in the main Kendrick repository and your fork became out of sync.
In order to do that, you need the fetch the last modifications from the main Kendrick repository, merge them in your image and then push them in your fork repository.

In your own local machine containing your cloned fork directory (i.e. you forked first Kendrick, and then executed "git clone ..." your own fork), you should always synchronize your GitHub fork with the latest modifications in the upstream before pushing any updates (pull requests). This can be done from command-line:

```bash
git remote add upstream https://github.com/UMMISC/kendrick.git
git fetch upstream
git checkout master
git rebase upstream/master
git push -f origin master
```

You have also the possibility to delete your fork and fork again the main Kendrick repository.

## Cleanups

Ounce your pull request is integrated, some cleanups are maybe required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

# Release management (not used at the moment)

# Branch management (to be defined)


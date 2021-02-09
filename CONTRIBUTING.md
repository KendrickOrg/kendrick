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

In order to contribute to Kendrick on github we are using Pharo 8.0 and Iceberg.

## Setup Iceberg

You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Fork the Kendrick repository

All changes you'll do will be versionned in your own fork of the [Kendrick repository](https://github.com/UNU-Macau/kendrick). Then, from your fork you'll be able to issue pull requests to Kendrick, where they will be reviewed, and luckily, integrated.

Go to Kendrick github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to kendrick.

## Load your fork version of Kendrick in your image

In your Pharo 8.0 image, load now the last development version of Kendrick :

```Smalltalk
Metacello new
        githubUser: 'XXX' project: 'kendrick' commitish: 'master' path:'src';
        baseline: 'Kendrick';
	onWarningLog;
        load
```
where you replace XXX with your github user name.

PS: at the moment, we have only one master branch, so all development happens on this branch. We will use two branches when we release a first version of Kendrick.

If you have problems loading with the previous script due to network issues, use the following one:

```Smalltalk
| count |
count := 1.
Transcript open.
[ true ] whileTrue: [ [
		^ Metacello new
		githubUser: 'XXX' project: 'kendrick' commitish: 'master' path:'src';
        baseline: 'Kendrick';
	onConflictUseLoaded;
        onWarningLog ;
        load.
	]
	on: IceGenericError "Failed to connect to github.com: Interrupted system call"
	do: [ : ex |
		Notification signal:
	        	String cr ,
			ex description,
			String cr ,
			'RETRYING ',
			count asString.
		(Delay forSeconds: 2) wait.
		ex retry
	].
	count := count + 1 ]
```

## Add main Kendrick repository as remote

Open Iceberg, open Kendrick repository, click on repositories, then + button (add remote).

Remote name: upstream

Remote URL: https://github.com/UNU-Macau/kendrick.git

## Send some changes to the original Kendrick repository

#### From Pharo Iceberg

After doing modifications in your image, open Iceberg tool, commit the changes in your Kendrick repository. Cherry-pick the modifications that you want to include in your commit. Then push your commit to your fork. It's more convenient to divide your changes in meaningful and simple commits, which makes it easier to check for those who need to proofread it.

![iceberge](images/iceberg_pharo.png)

#### From GitHub UI

In the GitHub interface, create a Pull Request (PR) from your commit.
You have to give some information about what is the purpose of you pull request. Then submit it to Kendrick main repository.
This will notify Kendrick core developers team that an improvement or bug fix is pending.

![create a pull request from github](images/github_pr.png)

As the main core developers, you have to review the open PRs. When merging the pull request, select *Create a merge commit* not  squash and merge. Try to avoid (except in case of emergency) to review your own commits.

## Pull changes from original to fork

You can proceed in two different ways to update your fork. You can either use github's web interface, or entirely from pharo/Kendrick.

### From GitHub GUI

If at some point, you see than the original Kendrick repository is ahead from your own fork (2 in the following picture) you can synchronize your own repository with all the newest features add to the original using compare (3)

![pull feature in your own](images/github_cp.png)

To compare you can define sources (1) and target (2) for the update. Once it's done, you can use the pull request mechanism (3) to merge the original Kendrick code to your own.

![pull feature in your own with PR](images/github_pr_fork.png)

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


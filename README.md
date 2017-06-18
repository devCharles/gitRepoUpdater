# gitRepoUpdater
## This shell script update all the git repositories that you have in a folder
### Instructions

To update all git repos in a folder you can use:
```sh
$ ./updateRepos.sh all
```
or
```sh
$ ./updateRepos.sh -a
```

To evaluate which repo update you can use:
```sh
$ ./updateRepos.sh each
```
or
```sh
$ ./updateRepos.sh -e
```

if you want to use the complete wizard, just use this:
```sh
$ ./updateRepos.sh
```
---
### Installing to use globally
Toinstall the script and use it anywhere in your system yo havr to clone this repository
```git
git clone https://github.com/devCharles/gitRepoUpdater.git
```
then cd to the repo
```sh
$ cd gitRepoUpdater
```
now we have to copy the 'updateRepos.sh' script to ```/usr/local/bin```
```sh
$ sudo cp updateRepos.sh /usr/local/bin
```
so now you can use the script by simply using
```sh
$ updateRepos.sh [flag]
```

### Notes
- in order to use the updater script you may have the right permission to execute the script

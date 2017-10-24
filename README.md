# gitRepoUpdater
## This shell script updates all of the git repositories that you have in a folder
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
To install this script and use it anywhere in your system you may clone this repository
```git
git clone https://github.com/devCharles/gitRepoUpdater.git
```
then cd into the new directory
```sh
$ cd gitRepoUpdater
```
now we must copy the 'updateRepos.sh' script to ```/usr/local/bin```
```sh
$ sudo cp updateRepos.sh /usr/local/bin
```
and you can use the script by simply using
```sh
$ updateRepos.sh [flag]
```

### Notes
- in order to use this script you may need to have the right permission level to execute the script

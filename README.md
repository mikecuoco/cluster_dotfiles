# Mike's dotfiles for CentOS clusters

* I maintain this repo as *my* dotfiles, forked from the amazing Paul Irish
* All bash awesomeness is from Paul
* I removed all macOS-centric stuff from Paul's setup

## overview of files

####  Automatic config
* `.vimrc`, `.vim` - vim config
* `.inputrc` - behavior of the actual prompt line

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - git ignored, explained below

#### manual run
* `symlink-setup.sh`  - sets up symlinks for all dotfiles and vim config.

#### git
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

### `.extra` for private configuration

There will be items that don't belong to be committed to a git repo, because either 1) it shoudn't be the same across your machines or 2) it shouldn't be in a git repo. Kick it off like this:

`touch ~/.extra && $EDITOR $_`

## TO-DOs

- [ ] fix `tmux.conf`
- [ ] setup or remove cron

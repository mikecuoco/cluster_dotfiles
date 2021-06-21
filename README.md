# Mike's dotfiles for CentOS clusters

* I maintain this repo as *my* dotfiles, forked from the amazing Paul Irish
* All bash awesomeness is from Paul
* I removed all macOS-centric stuff from Paul's setup
* I added favorite tools to .``env.yaml``

## overview of files

####  Automatic config
* `.vimrc`, `.vim` - vim config, obv.
* `.inputrc` - behavior of the actual prompt line

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, explained below
*  `.env.yaml` - psuedobase conda env with all my favorite shell tools

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

I have some EXPORTS, my PATH construction, and a few aliases for ssh'ing into my servers in there.


## TO-DOs

 - [ ] add all my conda yamls
     - [ ] add auto-updates to those envs
 - [ ] fix `tmux.conf`
 - [ ] add `.curlrc`
 - [ ] setup or remove cron
 - [ ] setup `.gemrc`?
 - [ ] install my custom `bin` (not on github yet as of 06/20/2021) 

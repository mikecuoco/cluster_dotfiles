# Mike's dotfiles for Linux 

- I maintain this repo as *my* dotfiles, forked from the amazing Paul Irish
- All bash awesomeness is from Paul
- I removed all macOS-centric stuff from Paul's setup

## Quickstart

```bash
# symlink dotfiles to home directory
bash symlink-setup.sh

# install conda
bash conda-setup.sh

# setup shell conda environment
cd ~
git clone https://github.com/mikecuoco/environments.git
mamba env create -f environments/conda/shell.yml

# setup git (paste auth token)
gh auth login -p https 
gh setup-git
```

## overview of files

####  Automatic config
- `.vimrc`, `.vim` - vim config
- `.inputrc` - behavior of the actual prompt line
- `.condarc` - my conda environment settings

#### shell environment
- `.aliases`
- `.bash_profile`
- `.bash_prompt`
- `.bashrc`
- `.exports`
- `.functions`
- `.extra` - git ignored, explained below

#### manual run
- `conda-setup.sh` - install conda, using [mambaforge-pypy3](https://github.com/conda-forge/miniforge/)
- `symlink-setup.sh`  - sets up symlinks for all dotfiles and vim config.

#### git
- `.git`
- `.gitattributes`
- `.gitconfig`
- `.gitignore`

### `.extra` for private configuration

There will be items that don't belong to be committed to a git repo, because either 1) it shoudn't be the same across your machines or 2) it shouldn't be in a git repo. Kick it off like this:

`touch ~/.extra && $EDITOR $_`

## TO-DOs

- [ ] setup or remove cron

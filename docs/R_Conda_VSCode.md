# Using R in VSCode (compatible with Remote and Conda work)

## 1. Install extensions

1. "R Extension for Visual Studio Code" by Yuki Ueda (extension ID: ikuyadeu.r)
2. "Remote - SSH" by Microsoft (extension ID: ms-vscode-remote.remote-ssh)

## 2. Attaching R sessions to VSCode

Add the following line to `~/.Rprofile` on each system you use (i.e. local and remote). Now, whenever R is started, it will attach to vscode.

```r
source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
```

## For each conda environment

1. Install [radian](https://github.com/randy3k/radian) and [r-languageserver](https://github.com/REditorSupport/languageserver) in your conda environment. Radian is an alternative R console with nice tab-completion and syntax highlighting, making for a more pleasant development environment. r-language server offers tab-completion and more in the editor.

    *NOTE: radian is written in Python, so don't install in base conda environment! Otherwise you will have conflicts when trying to create environments with alternate Python versions*

    I use [mamba](https://github.com/mamba-org/mamba), a reimplementation of conda in C++ (and is much faster)

    ```bash
    mamba install radian r-languageserver
    ```

    I just add them to the yaml file, along with my other favorites.

    ```yaml
    - conda-forge::radian
    - anaconda::r-languageserver
    - conda-forge::r-base>=4.1
    - conda-forge::r-essentials>=4.1
    - conda-forge::r-biocmanager
    ```

2. For intellisense to work properly for all packages in conda env, you must specify the environment-specific binaries for R and radian. You can do this easily by adding the following to `.vscode/settings.json`. This can be set globally in `~/.vscode/settings.json` or by workspace in `{workspace_dir}/.vscode/settings.json`. Since I use project-specific conda environments, I like doing it by workspace. Add other languages here if you plan to develop in those too.

    ```json
    {
        "r.rpath.linux": "path/to/conda_env/bin/R",
        "r.rterm.linux": "path/to/conda_env/bin/radian",
    }
    ```

# Appendix

## Turn off annoying linting

In VSCode settings, deselect "Enable diagnositics" under *Lsp: Diagnostics*
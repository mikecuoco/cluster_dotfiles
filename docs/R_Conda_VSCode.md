# Using R in VSCode (plus Conda compatibility)

## Initial setup

1. Install R Extension for Visual Studio Code by Yuki Ueda (ikuyadeu.r)
2. Install the R Debugger for VS Code extension (rdebugger.r-debugger)
3. Add the following line to `.Rprofile`. This will automatically attach the R session to vscode.

    ```r
    source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
    ```

## For each conda environment

*NOTE: Like most things, I'm unsure if this is OK to do in the base env*

1. Install radian and languageserver in conda environment.

    ```bash
    mamba install radian r-languageserver
    ```

    I just add them to the yaml file, along with my other favorites

    ```yaml
    - conda-forge::radian
    - anaconda::r-languageserver
    - conda-forge::r-base>=4.1
    - conda-forge::r-essentials>=4.1
    - conda-forge::r-biocmanager
    ```

2. For intellisense to work properly for all packages in conda env, we must specify the environment-specific binaries for python, R, and radian. We can do this easily by adding the following to `.vscode/settings.json`. This can be set globally in `~/.vscode/settings.json` or by workspace in `dir/.vscode/settings.json`

    ```json
    {
        "python.pythonPath": "path/to/env/bin/python",
        "r.rpath.linux": "path/to/env/bin/R",
        "r.rterm.linux": "path/to/env/bin/radian",
        "python.linting.enabled": false
    }
    ```

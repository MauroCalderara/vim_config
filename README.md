# vim_config

My configuration for the [vim editor](http://www.vim.org/). Serveral plugins are ``included'' as git submodules, the larger [YouCompleteMe](https://https://github.com/Valloric/YouCompleteMe) can be installed easily from within the running editor.

- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)

Overview
---

This is a vim configuration that aims to make using vim more comfortable. Plugins for programming, specifically C++ and python development, are enabled in the configuration but not contained in the git repository as submodules. They can be installed by running `:PluginInstall`. Most of the features are provided by the following vim plugins:

* [**CursorLineCurrentWindow**](https://github.com/vim-scripts/CursorLineCurrentWindow.git)  
    Underlines the cursor line and does so in the current window only. For me this saves quite some time looking for the cursor position.
* [**google.vim**](https://github.com/vim-scripts/google.vim.git)  
    Have vim use C++ settings (indenting) similar to the [Google C++ Styleguide](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml).
* [**nerdcommenter**](https://github.com/scrooloose/nerdcommenter.git)  
    Easily comment in/out sections of code. In C++ both one-line comments and multiline comments are supported. In this configuration marked regions can be commented out through <space>cc or <space>co and uncommented (commented in) through <space>ci.
* [**nerdtree**](https://github.com/scrooloose/nerdtree.git)  
    Show the directory structure in a separate vim panel for quick file navigation. In this configuration it is toggled through <Ctrl>-e.
* [**UltiSnips**](https://github.com/SirVer/ultisnips.git)  
    Snippets for vim. This is mostly useful for programming and the actual snippets probably depend heavily on the user preference. Therefore this plugin is not automatically installed when cloning the git repository. To install it run `:PluginInstall` from within vim.
* [**vim-abolish**](https://github.com/tpope/vim-abolish)  
    Smart, case sensitive replace for vim.
* [**vim-airline**](https://github.com/bling/vim-airline.git) and [**vim-airline-themes**](https://github.com/vim-airline/vim-airline-themes.git)  
    A [PowerLine](https://github.com/powerline/powerline)-like status bar for vim. Vim-airline will be activated if [PowerLine](https://github.com/powerline/powerline) is not installed on the system or in the user's home.
* [**vim-git**](https://github.com/tpope/vim-git.git)  
    Syntax, indent and filetype plugin for git. This does not provide support for git repository information within vim itself (use [*vim-fugitive*](https://github.com/tpope/vim-fugitive) for this).
* [**vim-sensible**](https://github.com/tpope/vim-sensible.git)  
    A basic minimal configuration that should work for most people. I like the idea to have such a least common denominator so this configuration only contains deviations from [vim-sensible](https://github.com/tpope/vim-sensible.git).
* [**vimtex**](https://github.com/lervag/vimtex.git)  
    A simple but reliable vim plugin for LaTeX support.
* [**vundle**](https://github.com/gmarik/vundle.git)  
    The plugin used to manage the other plugins (installing plugins and keeping them up to date).
* [**YCM-Generator**](https://github.com/rdnetto/YCM-Generator.git)  
    Generates `.ycm_extra_config` files for [YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git). This plugin only makes sense when used in combination with [YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git) and is thus not automatically installed. It can be installed with `:PluginInstall`.
* [**YouCompleteMe**](https://github.com/Valloric/YouCompleteMe.git)  
    A rather large plugin to provide support for semantic completion in C/C++ and python code through the use of `libclang` and `jedi`, respectively. Strongly recommended for developing in these languages but a rather large plugin with a compiled component. It is not automatically installed when checking out the configuration in order to make the settings useful for non-programming tasks as well. The plugin can be installed using `:PluginInstall`.


Installation
---

A simple `git clone --recursive` to `~/.vim` should install the basic configuration and the reasonably light-weight plugins (i.e. all but [UltiSnips](https://github.com/SirVer/ultisnips.git) and [YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git)/[YCM-Generator](https://github.com/rdnetto/YCM-Generator.git)). The larger plugins can be installed using `:PluginInstall` from within vim.

Installed plugins can be updated using `:PluginUpdate` from within vim.


Usage
---

The commands and keybindings specific to this configuration are listed here. Note that the bindings distinguish between `CTRL+x` and `CTRL+SHIFT+x`. Since most terminals don't distinguish between `CTRL+x` and `CTRL+SHIFT+x` for historical reasons, they need to be configured to send specific escape sequences when the user presses these keys. Not all terminal emulators can be configured to do so. My matching configuration for `urxvt` can be found [here](https://github.com/MauroCalderara/urxvt_config).


**Standard configuration**

| Mode | Command / Key combination | Action |
| ---- | ------------------------- | ------ |
| normal | `<C-S-p>` | Toggle paste mode |
| normal | `<C-m>` | Toggle line numbers |
| any | `<C-\>` | Create a vertical split |
| any | `<C-_>` | Create a horizontal split |
| any | `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | Go to ``left``, ``upper``, ``lower``, ``right`` window |
| any | `<C-S-h>`, `<C-S-j>`, `<C-S-k>`, `<C-S-l>` | Move window ``left``, ``up``, ``down``, ``right`` |
| any | `<C-g>`, `<C-;>` | Decrease/increase window size horizontally |
| any | `<C-/>`, `<C-y`  | Decrease/increase window size vertically |
| any | `<C-n>`          | Create new tab |
| any | `<C-u>`, `<C-i>` | Got to previous/next tab |
| any | `<C-S-u>`, `<C-S-i>` | Move window to previous/next tab |
| normal | `F5` | Build code using `make` |
| normal | `F7` | Toggle spell checking/cycle language for spellchecking |


[**nerdcommenter**](https://github.com/scrooloose/nerdcommenter.git) specific

| Mode | Command / Key combination | Action |
| ---- | ------------------------- | ------ |
| normal, visual | `<space>cc` | Comment out section using single line comments |
| normal, visual | `<space>co` | Comment out section using multi line comments (if available) |
| normal, visual | `<space>ci` | Comment in section |


[**nerdtree**](https://github.com/scrooloose/nerdtree.git) specific

| Mode | Command / Key combination | Action |
| ---- | ------------------------- | ------ |
| normal, visual | `<C-e>` | Toggle file browser |


[**UltiSnips**](https://github.com/SirVer/ultisnips.git) specific

TODO


[**vim-abolish**](https://github.com/tpope/vim-abolish) specific

| Mode | Command / Key combination | Action |
| ---- | ------------------------- | ------ |
| command | `:%S,foo,bar,` | Replaces `foo` by `bar` respecting the case |


[**vim-git**](https://github.com/tpope/vim-git.git) specific

There are no keybindings/commands for [**vim-git**](https://github.com/tpope/vim-git.git). To use vim/vimdiff and the supplied template for git commit messages run

`git config --global merge.tool vimdiff`  
`git config --global diff.tool vimdiff`  
`git config --global difftool.prompt false`  
`git config --global commit.template ~/.vim/extra/git/commitmsg-template.txt`  


[**YouCompleteMe**](https://github.com/Valloric/YouCompleteMe.git)/[**YCM-Generator**](https://github.com/rdnetto/YCM-Generator.git) specific

| Mode | Command / Key combination | Action |
| ---- | ------------------------- | ------ |
| normal | `<space>yg` | Go to definition/implementation/header |
| normal | `<C-p>`, `<C-o>` | Go backward/forward in location list, i.e. back to code/definition/source |
| normal | `<space>yu` | Update diagnostics |
| normal | `<space>ys` | Show a list of all errors in the location bar |
| normal | `<space>yt` | Show type of object under cursor (C/C++) |
| normal | `<space>yd` | Show docstring of object under cursor (python) |
| normal | `<space>yf` | Try to fix error under cursor |
| normal | `<space>yc` | Regenerate `.ycm_extra_conf.py` (requires a restart of vim, unfortunately) |

[YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git) will show suggestions while you type in code. To cycle between the suggestions, type `<Tab>`. Once the right completion is selected, keep typing to exit the completer.

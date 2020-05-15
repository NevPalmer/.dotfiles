# Dotfiles
This repo contains configuration files for shell, vim, etc.

[Dotbot](https://github.com/anishathalye/dotbot) is used to correctly create 
symlinks for files and directories after cloning .dotfiles repo.
## Installation of all Dotfiles for Linux.
```
cd ~
git clone https://github.com/NevPalmer/.dotfiles.git
cd .dotfiles
./install
vim
:PlugStatus
:PlugInstall
```
## Installation of Vim/Gvim configuaration for MS Windows.
```
cd %HOMEPATH%
git clone https://github.com/NevPalmer/.dotfiles.git
mklink _vimrc .dotfiles\vimrc
vim
:PlugStatus
:PlugInstall
```
## Firefox
If using MarkdownPreview with Firefox you may need to set the following for the plugin to autoclose the preview window.
1. Open Firefox
1. Type `about:config` in the address bar and press the `Enter` key.
1. Search for `dom.allow_scripts_to_close_windows` and set its value to `true`.  
***Both Vim and Gvim should now be configured.***

***Your configuration should be complete!***

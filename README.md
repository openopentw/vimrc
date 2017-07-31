# Vimrc
This is my Vim-setting files.

*PS: The `raw` folder contains my previous Vim settings on Windows.  It may contain a lot of bugs and strange codes if you want to use it.*

## Brief Descriptions of Installation

- Install this repository and copy `.vimrc` and `.vim/` to home directory.
  (Don't forget to backup your old vim files. I am not doing this here.)

  ```shell
  cd Vimrc/
  cp .vimrc ~/
  cp -r .vim/ ~/
  ```

- Use command `PlugInstall` to install vim plug-ins.

  ```shell
  vim ~/.vimrc
  :PlugInstall
  ```

- Follow the descriptions inside [Valloric / YouCompleteMe](https://github.com/Valloric/YouCompleteMe) to install the plug-in `YouCompleteMe`.

## Work Progress of the Files

The files are Roughly finished.

Right now, the files are set on Ubuntu 17.04 on my own computer. Both terminal-Vim and GVim works great.

In the future, I will try to make this file work on Windows Gvim.

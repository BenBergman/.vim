# BenBergman's Vim Configuration

This repository contains my various customizations for [Vim]. To use this setup, you must first clone the repository.

```bash
$ git clone git://github.com/BenBergman/.vim.git ~/.vim
```
or if you are me

```bash
$ git clone git@github.com:BenBergman/.vim.git ~/.vim
```

My configuration depends on [Vundle] to manage my preferred plugins, so the next thing you will have to do is initialize that.

```bash
$ cd ~/.vim
$ git submodule update --init
$ vim -u bundles.vim +BundleInstall +q
```

Lastly, you will have to symlink `.vimrc` into `~`

```bash
$ ln -s ~/.vim/.vimrc ~/.vimrc
```

Alternatively, you can create a `.vimrc` that includes the one from this repository

```bash
$ echo -e 'if filereadable("~/.vim/.vimrc")\n\tsource ~/.vim/.vimrc\nendif' >> ~/.vimrc
```

I have made some effort to make my configuration cross platform compatible, but I use Windows and Mac so rarely that many of the features have not been fully tested on those platforms. Feel free to report any problems you encounter or submit fixes.

# WARNING

I have a very particular way I like things, and that includes remapping the number and symbol rows in insert mode. Most people will probably be thrown off by this if they don't look at `.vimrc` before using it, so make sure you are aware of this and disable it before launching vim if you do not want it.

[Vim]:http://vim.org
[Vundle]:http://github.com/gmarik/vundle
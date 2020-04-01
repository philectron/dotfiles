rem Make Windows-style hard links/junctions for dotfiles

rmdir /S /Q %UserProfile%\.bash
mklink /J %UserProfile%\.bash %UserProfile%\dotfiles\bash

del /Q %UserProfile%\.bash_profile
mklink /H %UserProfile%\.bash_profile %UserProfile%\dotfiles\bash_profile

del /Q %UserProfile%\.bashrc
mklink /H %UserProfile%\.bashrc %UserProfile%\dotfiles\bashrc

del /Q %UserProfile%\.clang-format
mklink /H %UserProfile%\.clang-format %UserProfile%\dotfiles\clang-format

del /Q %UserProfile%\.gitconfig
mklink /H %UserProfile%\.gitconfig %UserProfile%\dotfiles\gitconfig

del /Q %UserProfile%\.gitignore_global
mklink /H %UserProfile%\.gitignore_global %UserProfile%\dotfiles\gitignore_global

del /Q %UserProfile%\.inputrc
mklink /H %UserProfile%\.inputrc %UserProfile%\dotfiles\inputrc

del /Q %UserProfile%\.jsbeautifyrc
mklink /H %UserProfile%\.jsbeautifyrc %UserProfile%\dotfiles\jsbeautifyrc

del /Q %UserProfile%\.minttyrc
mklink /H %UserProfile%\.minttyrc %UserProfile%\dotfiles\minttyrc

del /Q %UserProfile%\.tmux.conf
mklink /H %UserProfile%\.tmux.conf %UserProfile%\dotfiles\tmux.conf

del /Q %UserProfile%\.uncrustifyrc
mklink /H %UserProfile%\.uncrustifyrc %UserProfile%\dotfiles\uncrustifyrc

rmdir /S /Q %UserProfile%\.vim
mklink /J %UserProfile%\.vim %UserProfile%\dotfiles\vim

del /Q %UserProfile%\.vimrc
mklink /H %UserProfile%\.vimrc %UserProfile%\dotfiles\vimrc

rmdir /S /Q %UserProfile%\.zsh
mklink /J %UserProfile%\.zsh %UserProfile%\dotfiles\zsh

del /Q %UserProfile%\.zshrc
mklink /H %UserProfile%\.zshrc %UserProfile%\dotfiles\zshrc

rem Update all submodules recursively
git submodule update --init --recursive

pause

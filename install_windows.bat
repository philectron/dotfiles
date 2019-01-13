:: Make Windows-style hard links/junctions for dotfiles

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

del /Q %UserProfile%\.ssh\config
mklink /H %UserProfile%\.ssh\config %UserProfile%\dotfiles\ssh\config

del /Q %UserProfile%\.uncrustifyrc
mklink /H %UserProfile%\.uncrustifyrc %UserProfile%\dotfiles\uncrustifyrc

rmdir /S /Q %UserProfile%\.vim
mklink /J %UserProfile%\.vim %UserProfile%\dotfiles\vim

del /Q %UserProfile%\.vimrc
mklink /H %UserProfile%\.vimrc %UserProfile%\dotfiles\vimrc

:: specific config for Mintty/Git Bash on Windows
del /Q %UserProfile%\.minttyrc
mklink /H %UserProfile%\.minttyrc %UserProfile%\dotfiles\minttyrc

pause

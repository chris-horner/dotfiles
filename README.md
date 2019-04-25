dotfiles
========

Version control for config files is super handy! Who knew!?

Using
-----

All dotfiles should be modified in `~/dotfiles`, then synchronised with the home directory by running something like...
```shell
cd ~/dotfiles
stow vim
```

### Sublime

Sublime's a trickier one to synchronise thanks to Windows being a pain. The `sublime` folder in this repository should be symlinked to
```
%APPDATA%\Sublime Text 3\Packages\User
```
on Windows, and
```
~/.config/sublime-text-3/Packages/User
```
on Unix.

The easiest way to achieve this on Windows is using a [Junction](https://en.wikipedia.org/wiki/NTFS_junction_point).
This looks something like
```batch
mklink /J "%APPDATA%\Sublime Text 3\Packages\User" "%USERDATA%\Repositories\dotfiles\sublime"
```
And for Unix
```shell
ln -s /home/username/dotfiles/sublime /home/username/.config/sublime-text-3/Packages/User
```

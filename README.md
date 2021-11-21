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

Sublime's a trickier one to synchronise. Symlinks need to be created to the appropriate folders on each operating system.

#### Windows
The easiest way to achieve this on Windows is using a [Junction](https://en.wikipedia.org/wiki/NTFS_junction_point).
```batch
mklink /J "%APPDATA%\Sublime Text\Packages" "%HOMEPATH%\dotfiles\sublime"
```

#### Linux
```shell
ln -s /home/username/dotfiles/sublime /home/username/.config/sublime-text-3/Packages
```

#### MacOS
```shell
ln -s /home/username/dotfiles/sublime /home/username/Library/Application\ Support/Sublime\ Text\ 3/Packages
```

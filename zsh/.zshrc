# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# Custom directory
ZSH_CUSTOM=$HOME/.zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="unraveler"

# Source sensitive variables not commited to VCS
source ~/.zsh_private

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias muse="unison -ignore \"Name .DS_STORE\" ~/Music ssh:koryo/media/server/Music/Chris"
alias gw="./gradlew"
alias gitBranches="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias ffs="sudo !!"

# Android home variable handy for various tools
export ANDROID_HOME=~/.android-sdk

# Add brew's bin directory to PATH
export PATH=$PATH:/usr/local/bin

# Add scripts folder to PATH
export PATH=$PATH:~/Scripts

# Add Android tools to PATH
export PATH=$PATH:~/.android-sdk/tools/bin

# Add jenv and java tools if they're available.
if hash jenv 2>/dev/null; then
  export PATH=$PATH:~/.jenv/bin
  eval "$(jenv init -)"
  export JAVA_HOME=$(/usr/libexec/java_home)
  export JDK_16="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
  export JDK_17="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
  export JDK_18="/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home"
fi

# added by travis gem
#[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh

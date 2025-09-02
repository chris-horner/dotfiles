if test (uname -s) = "Darwin"
  set -gx PATH ~/Library/Android/sdk/platform-tools/ $PATH
  set -gx PATH ~/bin/ $PATH
  set -x JAVA_HOME (/usr/libexec/java_home -v 17)
  set -x ANDROID_SDK_ROOT ~/Library/Android/sdk
  set -x ANDROID_SDK ~/Library/Android/sdk
  set -x SECRETS_PATH ~/secrets
  source ~/secrets/config.fish
end

alias gw "./gradlew"
alias gitBranches "git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias killd 'jps | grep Daemon | cut -d'\'' '\'' -f1 | xargs kill -9'
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

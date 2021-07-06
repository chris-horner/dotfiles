if test (uname -s) = "Darwin"
  set -gx PATH ~/Library/Android/sdk/platform-tools/ $PATH
  set -x JAVA_HOME (/usr/libexec/java_home -v 11)
  set -x ANDROID_SDK_ROOT ~/Library/Android/sdk
end

alias gw "./gradlew"
alias gitBranches "git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

if test (uname -s) = "Darwin"
  set -gx PATH ~/Library/Android/sdk/platform-tools/ $PATH
end

alias gw "./gradlew"
alias gitBranches "git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

if test (uname -s) = "Darwin"
  set -gx PATH ~/Library/Android/sdk/platform-tools/ $PATH
  set -gx PATH /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/ $PATH
  set -x JAVA_HOME JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/
  alias smackafee='sudo launchctl unload /Library/LaunchDaemons/com.mcafee.*'
end

alias gw "./gradlew"
alias gitBranches "git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

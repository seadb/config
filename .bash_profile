export CLICOLOR=1

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
echo "Initialising new SSH agent..."
/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
echo succeeded
chmod 600 "${SSH_ENV}"
. "${SSH_ENV}" > /dev/null
/usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
  start_agent;
}
   else
     start_agent;
   fi

   ### Set architexture flags
   #
   export ARCHFLAGS="-arch x86_64"
   PATH=/opt/local/bin:$PATH
   PATH=/opt/local/bin:$PATH

   ### Added by the Heroku Toolbelt
   #
   export PATH="/usr/local/heroku/bin:$PATH"

   ### git alias
   #

   alias gst='git status'
   alias gco='git checkout'
   alias gci='git commit'
   alias grb='git rebase'
   alias gbr='git branch'
   alias gpl='git pull'
   alias gpu='git push'
   alias gad='git add -A'
   alias gmt='git mergetool'
   alias bdf='git diff'
   alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
   alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'


   source ~/bin/git-completion.bash

   export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

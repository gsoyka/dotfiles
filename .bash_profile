### Exports ###
export PATH=/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin:~/.composer/vendor/bin:~/Library/Python/3.7/bin:~/Library/Python/3.6/bin:/usr/local/opt/go/libexec/bin:$PATH
export BASH_CONF="bashrc"
export BASH_CONF="bash_profile"
export KOPS_STATE_STORE=s3://kubernetes-config-bucket-configbucket-xcfn2xf3tn5n
export AWS_CONFIG_FILE=~/.aws/config
export AWS_SDK_LOAD_CONFIG="true"
export GOPATH=/Users/gsoyka/Work_Projects/go
export USER=$(id -un)
export USERID=$(id -u)
export GROUP=$(id -gn)
export GID=$(id -g)
# export AWS_SESSION_TTL=1h
# export AWS_ASSUME_ROLE_TTL=1h



# Ansible Exports
export ANSIBLE_NOCOWS=1
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
export ANSIBLE_RETRY_FILES_ENABLED=0
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Nicer prompt.
export PS1='\[\e[0;96m\]\]\w\[\e[0;33m\]\[$(__git_ps1)\] \[\e[0m\]\]\[$\] '

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Java Exports
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)

### Aliases ###
alias gca="git commit -a -m"
alias gp="git push"
alias dockerrmall="docker rm $(docker ps -aq)"
alias dockerstats='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'
alias gua='find . -type d -depth 1 -not -path ".*/" -not -path CloudFoundry -not -path docker -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
alias md5sum='md5 -r'
alias pip="pip3"

# Java Aliases
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java12='export JAVA_HOME=$JAVA_12_HOME'

### Completers ###
complete -C '/usr/local/bin/aws_completer' aws

# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

### Functions ###
function ecr_login {
  eval "$(aws --profile $1 ecr get-login --no-include-email --region $2)"
}

function fmgeo_ecr_login {
  aws --profile pipeline ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 632106808859.dkr.ecr.us-east-1.amazonaws.com
}

function rancher-login {
  source ~/.rancher_credentials
  rancher login $endpoint --token $bearer_token
}

function bastion_ssh {
  ssh -i ~/.ssh/bastion_rsa.pem -o "StrictHostKeyChecking=no" ubuntu@bastion.$1.fmgeo.com
}

### Startup Items ###

# default to Java 11
java11

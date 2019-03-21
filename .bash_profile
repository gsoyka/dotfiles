export BASH_CONF="bashrc"
alias cfl="cf login -u 'soykagr' -a api.system.dev.east.paas.geointservices.io"
alias ssh-cl="ssh -i ~/.ssh/coastline-key.pem"
alias ssh-jenkins-dg="ssh gsoyka@107.23.253.39"
alias gca="git commit -a -m"
alias gp="git push"
alias dockerrmall="docker rm $(docker ps -aq)"
alias dockerstats='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'
alias gua='find . -type d -depth 1 -not -path ".*/" -not -path CloudFoundry -not -path docker -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'

export BASH_CONF="bash_profile"
export ANSIBLE_NOCOWS=1
export PATH=~/Library/Python/3.7/bin:~/Library/Python/3.6/bin:/usr/local/opt/go/libexec/bin:$PATH
complete -C '/usr/local/bin/aws_completer' aws

# Nicer prompt.
export PS1='\[\e[0;96m\]\]\w\[\e[0;33m\]\[$(__git_ps1)\] \[\e[0m\]\]\[$\] '

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

eval $(thefuck --alias)

# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

function ecr_login {
  eval "$(aws --profile $1 ecr get-login --no-include-email --region $2)"
}

function aws-mfa {
  eval $(awsmfa --identity-profile $1-long-term --target-profile $1 --env)
}
export AWS_CONFIG_FILE=~/.aws/organization_credentials.config

export GOPATH=/Users/gsoyka/Work_Projects/go
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass

alias md5sum='md5 -r'

export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/config-shared-services

complete -C '/usr/local/bin/aws_completer' aws

export KOPS_STATE_STORE=s3://kubernetes-config-bucket-configbucket-xcfn2xf3tn5n

function rancher-login {
  source ~/.rancher_credentials
  rancher login $endpoint --token $bearer_token
}

export BASH_CONF="bashrc"
alias cfl-dg="cf login -u 'gsoyka' -a https://api.sys.coastline.dg-cf-test.net --skip-ssl-validation"
alias ssh-cl="ssh -i ~/.ssh/coastline-key.pem"
alias ssh-jenkins-dg="ssh gsoyka@107.23.253.39"
alias gca="git commit -a -m"
alias gp="git push"
alias dockerrmall="docker rm $(docker ps -aq)"
alias dockerstats="docker stats $(docker ps --format={.Names}})"
export BASH_CONF="bash_profile"
export ANSIBLE_NOCOWS=1
export PATH=~/Library/Python/3.6/bin:$PATH
complete -C '/usr/local/bin/aws_completer' aws

# Nicer prompt.
export PS1="\[\e[0;96m\]\]\w \[\e[0m\]\]\[$\] "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi


# added by Miniconda2 4.3.21 installer
export PATH="/Users/gsoyka/miniconda2/bin:$PATH"

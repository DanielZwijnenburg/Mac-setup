alias migrate='bundle exec rake db:migrate db:test:clone'
alias aliases='vi ~/.zprofile; source ~/.zprofile'
alias rgm='rails g migration'
alias gpr='git pull -r'
alias db_reset='bundle exec rake db:drop db:create db:migrate && bundle exec rake db:seed db:test:clone'

alias ctagit='ctags -R --language-force=ruby --exclude=.git --exclude=log --exclude=.md --exclude=coverage --exclude=tmp * `bundle show --paths`'
alias vi=vim

export BUNDLER_EDITOR=vim
export DISABLE_COVERAGE=true
export EDITOR=vim
export PGHOST=localhost

alias cleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

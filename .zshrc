# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/Library/Python/3.8/bin
eval $(register-python-argcomplete ansible)
eval $(register-python-argcomplete ansible-config)
eval $(register-python-argcomplete ansible-console)
eval $(register-python-argcomplete ansible-doc)
eval $(register-python-argcomplete ansible-galaxy)
eval $(register-python-argcomplete ansible-inventory)
eval $(register-python-argcomplete ansible-playbook)
eval $(register-python-argcomplete ansible-pull)
eval $(register-python-argcomplete ansible-vault)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

eval "$(frum init)"

alias cz='code ~/.zshrc'
alias sz='source ~/.zshrc'
alias bi='bundle install'
alias rdbc='rails db:create'
alias rdbm='rails db:migrate'
alias rdbd='rails db:drop'
alias rr='rails routes'
alias rrg='rails routes --grep'
alias rgcpinn='rails generate controller Public index --no-helper --no-controller-specs'
alias rac='rails assets:clobber'
alias rtw='rails tailwindcss:watch'
alias dcu='docker compose up'
# alias rce='rails credentails:edit'

alias ber='bundle exec rspec'

alias rce='EDITOR="nano" bin/rails credentials:edit'

alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias grso='git remote set-url origin'
alias gcb='git checkout branch'
alias gcfb='git checkout -b'

alias ghrc='gh repo create'

alias rmpid='rm /usr/local/var/postgres/postmaster.pid'

function set_repo {
    git init -b main
    git add . && git commit -m "initial commit"
    gh repo create
}

function new_project {
  

  bundle add 'rspec'
  bundle add gem 'capybara'
  bundle add gem 'devise'

}

function migrate {
    RACK_ENV=development bundle exec rails db:migrate
    RACK_ENV=test bundle exec rails db:test
}

function project {
    rails new "$1" --css tailwind --database=postgresql -T
}

function start_project() {
  APP_NAME="${1}"
  MODULE_NAME=$(pascal "$APP_NAME")
  echo $MODULE_NAME
  git clone https://github.com/Sandbagger/docker-rails-example.git "$APP_NAME"
  cd "$APP_NAME"
  echo "Renaming project to ${APP_NAME}..."
  echo "Renaming module to ${MODULE_NAME}..."
  bin/rename-project "${APP_NAME}" "${MODULE_NAME}"
  cp .env.example .env
  gh repo create
  gh remote
}

function pascal {
    echo $1 | perl -pe "s/_(.)/\u\1/g; s/^(.)/\u\1/g"
}

function chromedriver {
    #!/bin/sh
# Downloads chromedriver based on your current chrome version, unzips, deletes zip file


# Get current chrome version
# separate version from other output (cut...-f3)
# separate first 3 fields (segments) of the version number (cut...-f1-3)
# Pass version number into xargs/curl call
CHROME_VERSION=$(/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version | cut -d ' ' -f3 | cut -d '.' -f1-3 | xargs -I {} curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE_{})

ZIP_FILE_NAME=chromedriver_mac64.zip

# Insert CHROME_VERSION into download URL:
curl -o ./$ZIP_FILE_NAME "https://chromedriver.storage.googleapis.com/$CHROME_VERSION/chromedriver_mac64.zip"

# Unzip. -o flag means overwrite
unzip -o $ZIP_FILE_NAME

rm $ZIP_FILE_NAME

# Clean / remove quarantine for Apple in order to open it
xattr -d com.apple.quarantine chromedriver
}


# function overshoot {
#   curl -s 'https://theovershoot.co/p/patience-on-inflation-is-paying-off' | htmlq '.paywall-files' | pandoc --from html --to markdown_strict | xq -m
# }

# function get-articals {
#     LIMIT=12
#     OFFSET=0
#     MAX=108

#     URLS=`curl -s 'https://theovershoot.co/api/v1/archive?sort=new&search=&limit=12'| jq 'map(.canonical_url)'`
#     echo $URLS
# } 

# function loop {
#      LIMIT=12
#     OFFSET=0
#     MAX=108

#     while [ $OFFSET -le $MAX ]
#     do
#         URLS=`curl -s "https://theovershoot.co/api/v1/archive?sort=new&search=&offset=$OFFSET&limit=12"| jq 'map(.canonical_url)'`
#         ALL_URLS=(${ALL_URLS[@]} ${URLS[@]})
#         echo Number: $OFFSET
#         OFFSET=$(($OFFSET + 12))
#     done
#     echo ${ALL_URLS[@]}
# }

# function last-path {
#  echo ${1##*/} | tr '-' ' '
# }

# function copy-note {
#     URL=$1
#     echo $URL
#     NAME=`echo ${1##*/} | tr '-' ' '`
#     echo $NAME
  
#     TEMPLATE_PATH=/Users/will/Documents/PPE/'Philosophy, politics and economics'/Templates/'Overshoot template.md'
#     NOTE_PATH=/Users/will/Documents/PPE/'Philosophy, politics and economics'/Sources/${NAME}.md
#     cp $TEMPLATE_PATH $NOTE_PATH
#     overshoot >> $NOTE_PATH

# }

# function install {
#     bundle install
#     yarn install
#     bundle exec rails db:environment:set
#     bundle exec rails db:create
#     rails generate rspec:install
#     precompile_asset_pipeline
#     migrate
# }

# function precompile_asset_pipeline {
#     rake assets:precompil
# }

# function flyt {
#     if [ -x "$(command -v flyctl)" ]; then
#   echo 'Error: git is not installed.' >&2
#   exit 1
# fi
#  echo 'Mo Error: git is not installed'
# }


# alias -g pi="pi@raspberrypi.local"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/will/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/will/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/will/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/will/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Fig post block. Keep at the bottom of this file.
#

# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

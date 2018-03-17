#!/bin/sh

echo "alias df='df -h -P'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -ail'
alias rc='echo "Re-reading profile" ; . ~/.bashrc '
alias grep='grep -i'
alias psg='\ps -ef | grep '
alias findg='find . | grep '
alias type='type -a'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myhostname=\"dig -x \$(dig +short myip.opendns.com @resolver1.opendns.com) | grep PTR | grep -v \; | awk '{print \$5}' | cut -d. -f1-3\"
alias netstat='netstat -plnt'
" > /root/.bash_aliases

cat /root/.bashrc | grep -v bash_aliases > /root/.bashrc
echo ". /root/.bash_aliases" >> /root/.bashrc

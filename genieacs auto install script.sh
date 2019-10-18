apt-get update 
apt-get upgrade 
#apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
#cd /usr/src 
#wget http://prdownloads.sourceforge.net/webadmin/webmin_1.910_all.deb
#dpkg --install webmin_1.910_all.deb 
apt-get install redis-server mongodb npm build-essential ruby-bundler ruby-dev libsqlite3-dev 
cd ~ 
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
./nodesource_setup.sh 
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list 
apt-get update && apt-get install yarn
apt-get install nodejs 
npm install libxmljs --unsafe-perm 
npm install -g genieacs --unsafe-perm 
git clone https://github.com/zaidka/genieacs-gui 
apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
cd genieacs-gui 
bundle
cp config/summary_parameters-sample.yml config/summary_parameters.yml 
cp config/index_parameters-sample.yml config/index_parameters.yml 
cp config/parameter_renderers-sample.yml config/parameter_renderers.yml 
cp config/parameters_edit-sample.yml config/parameters_edit.yml 
cp config/roles-sample.yml config/roles.yml 
cp config/users-sample.yml config/users.yml 
cp config/graphs-sample.json.erb config/graphs.json.erb
cd db/migrate
sudo sed -i '1!b;s/$/\[4.2]/g' *.rb
cd ~/genieacs-gui
cat << EOF > ./genieacs-start.sh
#!/bin/sh
if tmux has-session -t 'genieacs'; then
  echo "GenieACS is already running."
  echo "To stop it use: ./genieacs-stop.sh"
  echo "To attach to it use: tmux attach -t genieacs"
else
  tmux new-session -s 'genieacs' -d
  tmux send-keys 'genieacs-cwmp' 'C-m'
  tmux split-window
  tmux send-keys 'genieacs-nbi' 'C-m'
  tmux split-window
  tmux send-keys 'genieacs-fs' 'C-m'
  tmux split-window
  tmux send-keys 'cd genieacs-gui' 'C-m'
  tmux send-keys 'rails server -b 0.0.0.0' 'C-m'
  tmux select-layout tiled 2>/dev/null
  tmux rename-window 'GenieACS'

  echo "GenieACS has been started in tmux session 'geneiacs'"
  echo "To attach to session, use: tmux attach -t genieacs"
  echo "To switch between panes use Ctrl+B-ArrowKey"
  echo "To deattach, press Ctrl+B-D"
  echo "To stop GenieACS, use: ./genieacs-stop.sh"
fi
EOF

cat << EOF > ./genieacs-stop.sh
#!/bin/sh
if tmux has-session -t 'genieacs' 2>/dev/null; then
  tmux kill-session -t genieacs 2>/dev/null
  echo "GenieACS has been stopped."
else
  echo "GenieACS is not running!"
fi
EOF

chmod +x genieacs-start.sh genieacs-stop.sh

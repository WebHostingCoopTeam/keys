#!/bin/bash
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/addus.sh | bash
echo 'This is for Webhosting.coop dev only, this will add our keys to your server, BEWARE!'
touch /home/git/.ssh/authorized_keys
cp /home/git/.ssh/authorized_keys /tmp/gitsshauthorized_keys
wget https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/gitreceive-keys -O /tmp/gitsshauthorized_keys.new
cat /tmp/gitsshauthorized_keys.new >> /tmp/gitsshauthorized_keys
rm /tmp/gitsshauthorized_keys.new
cat /tmp/gitsshauthorized_keys|sort|uniq>/tmp/gitsshauthorized_keysuniq
rm /tmp/gitsshauthorized_keys
echo 'I will be adding these entries (removing duplicates):'
diff /tmp/gitsshauthorized_keysuniq /git/.ssh/authorized_keys
echo -n 'ctrl-C to stop now! or forever hold your peace'
sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.'
sleep 1
cp /tmp/gitsshauthorized_keysuniq /home/git/.ssh/authorized_keys
rm /tmp/gitsshauthorized_keysuniq
chown git. /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys

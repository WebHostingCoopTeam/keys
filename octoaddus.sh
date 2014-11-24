#!/bin/bash
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/addus.sh | bash
echo 'This is for Webhosting.coop dev only, this will add our keys to your server, BEWARE!'
mkdir /tmp/home
touch /home/git/.ssh/authorized_keys
cp /home/git/.ssh/authorized_keys /tmp/home/gitsshauthorized_keys
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/gitreceive-keys |xargs -n1 -I{} echo '{}'>> /tmp/home/gitsshauthorized_keys
cat /tmp/home/gitsshauthorized_keys|sort|uniq>/tmp/home/gitsshauthorized_keysuniq
rm /tmp/home/gitsshauthorized_keys
echo 'I will be adding these entries (removing duplicates):'
diff /tmp/home/gitsshauthorized_keysuniq /home/git/.ssh/authorized_keys
echo -n 'ctrl-C to stop now! or forever hold your peace'
sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.'
sleep 1
cp /tmp/home/gitsshauthorized_keysuniq /home/git/.ssh/authorized_keys
rm /tmp/home/gitsshauthorized_keysuniq

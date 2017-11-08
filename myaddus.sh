#!/bin/bash
if [ -d "$HOME/.ssh" ]
then
    echo 'ssh dir exists, proceeding...'
else
    echo 'ssh dir does not exist, please generate it with "ssh-keygen -t ecdsa" for example'
    ssh-keygen -tq ecdsa
    exit 1
fi
echo 'This is for Webhosting.coop dev only, this will add our keys to your server, BEWARE!'
touch $HOME/.ssh/authorized_keys
TMP=$(mktemp -d --suffix=SDX)
cp $HOME/.ssh/authorized_keys $TMP/mysshauthorized_keys
curl --silent https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/keys |xargs -n1 -I{} echo '{}'>> $TMP/mysshauthorized_keys
cat $TMP/mysshauthorized_keys|sort|uniq>$TMP/mysshauthorized_keysuniq
rm $TMP/mysshauthorized_keys
diff $TMP/mysshauthorized_keysuniq $HOME/.ssh/authorized_keys
cp $TMP/mysshauthorized_keysuniq $HOME/.ssh/authorized_keys
rm $TMP/mysshauthorized_keysuniq
rm -Rf $TMP

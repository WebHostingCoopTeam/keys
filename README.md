keys
====

public keys for coop devops

my add us to your server:

```
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/myaddus.sh | bash
```

or the historical (root specific)

```
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/addus.sh | bash
```

or use sudo:

```
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/myaddus.sh | sudo bash
```

on an octohost:
```
curl https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/octoaddus.sh |bash
```

but if you’re not a part of the coop then what are you doing this for?

okay to make the key making part easier I made a docker image that does nothing but make the gitreceive key for you:

https://github.com/joshuacox/gitrecievelinemaker

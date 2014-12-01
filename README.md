RedSparrow-vagrant
==================

Vagrant for RedSparrow


Install
------------------------
1. Download and install VirtualBox
2. [Download and install vagrant](https://www.vagrantup.com/)
3. clone this repo
3. Run vagrant up  in folder where you have cloned repo
```
vagrant[.exe] up
```
Afere ~30 minutes you'll have VM with:
* repo of RedSparrow and RedSparrowFront
* nginx, php,zmq

Test it
-------------------
```
http: localhost:8080
mysql localhost:33060
```

Update it
----------
```
git pull
vagrant provision
```


---
layout: post
title:  "How to connect to your MDM database when using Server.app"
---

I recently found out you can locally connect to the MDM database used by Server.app like this:

	sudo -u _devicemgr psql -h /Library/Server/ProfileManager/Config/var/PostgreSQL devicemgr_v2m0

However, I wanted to connect via Postico to this database, and that promised to be a challenge. The route that actually proved succesful was to create an additional user.

I used [LaunchControl][launch-control] to interact with Server.app's postgres-instance. We need some information about the instance, since we have another install of postgres on the machine. In LaunchControl, choose the `Server Daemons` option (⌘6) and search for the text `postgres`. You'll find the a daemon with the label `com.apple.DeviceManagement.postgres`.

-- Make socket accessible by group staff (no write rights at the moment)
sudo chown +R :staff /Library/Server/ProfileManager/Config/var/PostgreSQL

-- #Add this line to pg_hba.conf
-- local   all               archipuntadmin                          peer

launchctl stop com.apple.DeviceManagement.postgres #doet niets
launchctl kill SIGHUP com.apple.DeviceManagement.postgres #duurt lang
pg_ctl restart -D /Library/Server/ProfileManager/Config/ServiceData/Data/PostgreSQL #Permission denied
kill -HUP PID

-- sudo -u _devicemgr psql -h /Library/Server/ProfileManager/Config/var/PostgreSQL devicemgr_v2m0

CREATE USER archipuntadmin
	WITH LOGIN IN ROLE mdm_reader
;
GRANT CONNECT
   ON DATABASE devicemgr_v2m0
   TO archipuntadmin
;


psql -h /Library/Server/ProfileManager/Config/var/PostgreSQL devicemgr_v2m0


[launch-control]: https://www.soma-zone.com/LaunchControl/


## Exercise 1 ## 
List at least 10 Daemons running in your machine and explain each in one or two lines (soft copy only, just text file).

Reason: To understand importance of Daemons as many DD are Daemons.

(Approximate time taken - 2 hours)

### Terms used ### 
Stand-alone Daemon: basically a daemon that gives information to other process doesn't need any input from other process
super server Daemon Maange Daemons: Daemon that starts other servers when needed  

Sno| Daemon | Description
---|---|---
1 | systemd | Replacing the previously used **init** type daemons like SysVupstart, this daemon is the beginning of all the process in Unix programmed systems. This is an init replacement daemon designed to start process in parallel. The **systemd** is not just for startup but all for all process control.
2 | crond | "Chronos (God of time- Greek)" the cron daemon is for task scheduling of processes in the Unix systems, particularly the processes initiated by the user manually. This daemon takes input from a text file. *crontab* (cron table) is used edit the contents of this file. 
3 | dhcpd | The dhcp = Dynamic Host Control Protocol, this daemoservice is used to store the records of "leased" IPs and store them within a file in /var/lib. This becomes useful when there are multiple devices connected in a network and when the devices are rebooted the IPs allocated and the networking details like subnet masks, etc. come into play. 
4 | httpd | http = Hypertext Transfer Protocol. This is a stand-alone. This daemon is used to create a pool of child procesthreads to handle requests.
5 | xinetd | inetd- internet service daemon. **xinetd** is an upgraded version of the **inetd** This is a super server daemon used to provide internet services on Unix systems. The daemon being the super server daemon starts other daemons.
6 | syncd | **profile-sync-daemon (psd)** is a tiny pseudo-daemon designed to manage browser profile(s) in tempprary file storage and to periodically sync back to the physical disc (HDSSD). This is accomplished by an innovative use of rsync to maintain synchronization between a tmpfs copy and media-bound backup of the browser profile. This daemon also contains crash recovery features.
7 | syslogd | System logger process that collects various system messages. This daemon is a server daemon that provides a message logging facility for application and system processes. The syslog daemon is started by the **inetd** and receives messages on port 514. The syslog daemon must be started before any application program or system process that uses it starts. It provides a unified means of handling log files. It accepts log messsages delivered from servers and programs and directs them to the appropriate log files. This enables the consolidation of messages from various sources in standard log files, which makes them easier to manage.
8 | atd | **Atd** is actually the 'at' daemon that runs in the background of your Linux system and executes commands at a specific time. It can schedule both one-off commands and scripts, and there's no need to worry about them running a second time or the need to be present to run them.
9 | klogd | klogd is responsible for reading log entries from the kernel’s message buffer and forwarding them to syslog so that they can be routed to their final destination.
10 | ypbind | The ypbind daemon runs on all NIS clients and servers. It locates an NIS server to which queries can be directed. ypbind does not actually process requests itself; it just tells client programs which server to use.
---
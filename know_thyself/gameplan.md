##TTP initial access:
Drive by (exploit through services, malicious code in old web server, etc) - make sure versions are updated/secure?
Compromised credentials - change creds
Other remote services - secure authorized and just brick the rest

###Initial access:
Firewall - block everything, reset state tables, airgap the workstation
Service hardening/removing insecure remote services  - sql passwords, php functions, make sure ssh auth is working properly (may have to configure PAM)
Change default creds
backups
Allow service ports through, allow outbound connections  - monitor outbound (netstat -nputw)
Update critical services 
More backups

###Execution:
Crontabs/check for running backdoors already in the environment
Antivirus - chkrootkit, clamav
User rights - /etc/sudoers, /etc/group

###persistence/privesc:
linpeas


random:
Regenerate ssl creds for https servers 
 

